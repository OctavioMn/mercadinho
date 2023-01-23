class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]

  # GET /vendas or /vendas.json
  def index
    @vendas = Venda.all.page(params[:page])
    @items = Item.all
    @total_venda = 0
  end

  # GET /vendas/1 or /vendas/1.json
  def show
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
    @produtos = Produto.all
    @clientes = Cliente.all
  end

  # GET /vendas/1/edit
  def edit
    @clientes = Cliente.all
    @items = Item.all
    @produtos = Produto.all
    @item = Item.new
    @vendas = Venda.all
  end

  # POST /vendas or /vendas.json
  def create
    @venda = Venda.new(venda_params)
    @clientes = Cliente.all
    respond_to do |format|
      if @venda.save
        format.html { redirect_to edit_venda_path(@venda), notice: "Venda was successfully created." }
        format.json { render :new, status: :created, location: @venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1 or /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to vendas_path notice: "Venda was successfully updated." }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1 or /vendas/1.json
  def destroy
    @venda.destroy

    respond_to do |format|
      format.html { redirect_to vendas_url, notice: "" }
      format.json { head :no_content }
    end
  end 

  def generate

    @vendas = Venda.all
    pdf = Prawn::Document.new

    pdf.text "RUBYMARKET - Relatório de Vendas"
    pdf.move_down 25

    @vendas.each do |venda| 
      pdf.text "######################Venda - #{venda.id.to_s}######################"
      pdf.move_down 5
      @itens = Item.where(venda_id: venda.id).page(params[:page])
      @total_venda = 0 
      pdf.text "Nome do Cliente: #{venda.cliente.nome}"
      pdf.text "Produto(s): "
      @itens.each do |item|
        pdf.text "-#{item.produto.nome}(#{item.quantidade.to_s})"
        @total_venda += item.preco_total 
      end 

      pdf.text "Total da Venda(R$) #{@total_venda.to_s}"
      pdf.move_down 23
    end

    send_data pdf.render, filename: "relatorio-vendas#{Date.today}.pdf", type: "application/pdf"

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venda
      @venda = Venda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venda_params
      params.require(:venda).permit(:produto_id, :cliente_id)
    end
end
