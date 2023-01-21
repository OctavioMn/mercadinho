class Itemvenda < ApplicationRecord
    belongs_to :produto
    belongs_to :venda

    def preco_unico
      if persisted?
        self[:preco_unico]
      else
        produto.preco
      end
    end
    
    def total
      preco_unico * quantidade
    end

    private

    def set_preco_unico
        self[:preco_unico] = preco_unico
    end
        
    def set_total
        self[:total] = total * quantidade
    end
end
