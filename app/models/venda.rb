class Venda < ApplicationRecord
  paginates_per 2
  belongs_to :produto
  belongs_to :cliente
end
