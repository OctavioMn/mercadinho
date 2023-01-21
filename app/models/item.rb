class Item < ApplicationRecord
  paginates_per 2

  belongs_to :produto
  belongs_to :venda, :optional => true

  before_save :set_preco_unico
  before_save :set_preco_total

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


  private

  def set_preco_unico
    self[:preco_unico] = preco_unico
  end

  def set_preco_total
    self[:preco_total] = preco_total * quantidade
  end
end
