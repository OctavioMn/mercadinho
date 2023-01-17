class Cliente < ApplicationRecord
  has_many :vendas
  has_many :produtos, through: :vendas
end
