class AddRememberToUserSession < ActiveRecord::Migration[5.0]
  def change
    add_column :user_sessions , :remember, :boolean
  end
end
