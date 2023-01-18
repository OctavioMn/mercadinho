class Produto < ApplicationRecord
  paginates_per 2
  has_many :vendas
  has_many :clientes, through: :vendas
end
