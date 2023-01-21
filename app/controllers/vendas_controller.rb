class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]

  # GET /vendas or /vendas.json
  def index
    @vendas = Venda.all.page(params[:page])
    @items = Item.all
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
        format.html { redirect_to venda_url(@venda), notice: "Venda was successfully updated." }
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
      format.html { redirect_to vendas_url, notice: "Venda was successfully destroyed." }
      format.json { head :no_content }
    end
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
