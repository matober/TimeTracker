class ChangeNameToAName < ActiveRecord::Migration[5.0]
  def change
    rename_column :activities, :name, :a_name
  end
end
