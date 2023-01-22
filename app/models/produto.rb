class Produto < ApplicationRecord
  paginates_per 4

  has_many :items, :dependent => :destroy

  validates :nome, presence: {message: "não preenchido."}, uniqueness: {message: "do produto já cadastrado!"}
  validates :preco, presence: {message: "não preenchido."}

  
end
