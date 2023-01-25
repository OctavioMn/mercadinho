class Cliente < ApplicationRecord

  paginates_per 4
  has_many :vendas, :dependent => :destroy

  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: {message: "já cadastrado!"}, length: { minimum: 14, message: "inválido"}
  validates :idade, presence: true

end
