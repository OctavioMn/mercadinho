class Produto < ApplicationRecord
  has_many :vendas
  has_many :clientes, through: :vendas
end
