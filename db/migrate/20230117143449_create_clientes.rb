class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.integer :cpf
      t.integer :idade

      t.timestamps
    end
  end
end
