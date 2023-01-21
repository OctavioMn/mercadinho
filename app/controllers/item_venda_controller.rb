class ItemVendaController < ApplicationController

    def create
        @venda = current_venda
        @itemvenda = @item.itemvendas.new(venda_params)
        @venda.save
        session[:venda_id] = @venda.id
    end


    private 

    def venda_params
        params.require(:vendaitem).permit(:produto_id, :quantidade)
    end
end
