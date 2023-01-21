class CreateVendas < ActiveRecord::Migration[7.0]
  def change
    create_table :vendas do |t|
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
