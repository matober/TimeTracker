class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_hash
      t.string :password_salt
      t.datetime :created_at
      t.datetime :updated_at
      t.string :persistence_token
      t.string :crypted_password
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
