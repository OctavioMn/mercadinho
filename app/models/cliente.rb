class Cliente < ApplicationRecord
  paginates_per 2
  has_many :vendas
  has_many :produtos, through: :vendas
end
