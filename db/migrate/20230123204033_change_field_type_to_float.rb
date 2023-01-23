class ChangeFieldTypeToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :produtos, :preco, :float
  end
end
