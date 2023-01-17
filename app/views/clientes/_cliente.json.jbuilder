json.extract! cliente, :id, :nome, :cpf, :idade, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
