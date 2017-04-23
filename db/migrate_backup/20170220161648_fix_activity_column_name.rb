class FixActivityColumnName < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :activities, :name, :a_name
  end
end
