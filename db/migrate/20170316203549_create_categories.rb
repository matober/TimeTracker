class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :users, foreign_key: true
  end
end
