class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :produto, null: false, foreign_key: true
      t.references :venda, null: false, foreign_key: true
      t.integer :quantidade
      t.float :preco_unico
      t.float :preco_total

      t.timestamps
    end
  end
end
