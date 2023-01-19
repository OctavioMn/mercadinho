class Produto < ApplicationRecord
  paginates_per 4
  has_many :vendas
  has_many :clientes, through: :vendas
end
