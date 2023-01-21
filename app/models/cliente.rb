class Cliente < ApplicationRecord
  paginates_per 4
  has_many :vendas

  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: {message: "já cadastrado!"}
  validates :idade, presence: true


end
