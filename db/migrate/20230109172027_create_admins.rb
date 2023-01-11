class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :user
      t.string :senha
      t.timestamps
    end
  end
end
