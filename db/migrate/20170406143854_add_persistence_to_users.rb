class AddPersistenceToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :persistence_token, :string
  end
end
