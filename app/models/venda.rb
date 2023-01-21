class Venda < ApplicationRecord
  paginates_per 4
  belongs_to :cliente

  has_many :items


  def subtotal
    itemvendas.collect{|itemvenda| itemvenda.valid? ? itemvenda.preco_unico*itemvenda.quantidade : 0 }.sum
  end

  def set_subtotal
    self[:subtotal] = subtotal
  end

end
