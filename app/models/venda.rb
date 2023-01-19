class Venda < ApplicationRecord
  paginates_per 4
  belongs_to :produto
  belongs_to :cliente
end
