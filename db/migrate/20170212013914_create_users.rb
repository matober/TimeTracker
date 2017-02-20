class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :user do |t|

      t.string :email
      t.string :password
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end
  end
end
