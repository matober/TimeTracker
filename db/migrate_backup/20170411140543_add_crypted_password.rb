class AddCryptedPassword < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :crypted_password, :string, null: false
  end
end
