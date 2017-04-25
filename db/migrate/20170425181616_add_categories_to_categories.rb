class AddCategoriesToCategories < ActiveRecord::Migration[5.0]
  #This is the migration that will allow categories to be nested within each other
  def change
    add_reference :categories, :category, foreign_key: true
  end
end
