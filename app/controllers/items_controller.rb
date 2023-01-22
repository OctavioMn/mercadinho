class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def preco_unico
    @produtos = Produto.all
    if persisted?
      self[:preco_unico]
    else
      produto.preco
    end
  end

  def preco_total
    preco_unico * quantidade
  end

  def preco_total_venda
    preco_total_venda += preco_unico
  end

  def 

  def index
    @items = Item.all.page(params[:page])
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @produtos = Produto.all
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url("@item"), notice: "Item adicionado ao carrinho." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to item_url("@item"), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:produto_id, :venda_id, :quantidade)
    end

    def set_preco_unico
      self[:preco_unico] = preco_unico
    end
  
    def set_preco_total
      self[:preco_total] = preco_total * quantidade
    end

    def set_total_venda
      self[:total_venda] = preco_total_venda += preco_unico
    end
end
