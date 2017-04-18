class AddPerishableTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :perishable_token, :string
  end
end
