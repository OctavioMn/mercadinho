module ApplicationHelper
    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end

    def current_venda
        if !session[:venda_id].nil?
            Venda.find(session[:venda_id])
        else
            Venda.new
        end
    end
end
