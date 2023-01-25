class ChangeColumnTypeOfString < ActiveRecord::Migration[7.0]
  def change
    change_column :clientes, :cpf, :string
  end
end
