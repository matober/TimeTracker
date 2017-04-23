class FixReferenceForActivity < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :category_id, foreign_key: false
    add_reference :activities, :categories, foreign_key: true


  end
end
