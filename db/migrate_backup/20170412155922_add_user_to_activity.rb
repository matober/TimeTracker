class AddUserToActivity < ActiveRecord::Migration[5.0]
  def change
    add_reference :activities, :users, foreign_key: true
  end
end
