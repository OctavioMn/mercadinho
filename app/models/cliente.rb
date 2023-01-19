class Cliente < ApplicationRecord
  paginates_per 4
  has_many :vendas
  has_many :produtos, through: :vendas
end
