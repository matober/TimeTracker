class FixReferences < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :categories_id, foreign_key: false
    remove_column :activities, :users_id, foreign_key: false
    remove_column :categories, :users_id, foreign_key: false


    add_reference :activities, :category, foreign_key: true
    add_reference :activities, :user, foreign_key: true
    add_reference :categories, :user, foreign_key: true

  end
end
