json.extract! item, :id, :produto_id, :venda_id, :quantidade, :preco_unico, :preco_total, :created_at, :updated_at
json.url item_url(item, format: :json)
