class FixActivitiesName < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :activities, :a_name, :name
  end

  def self.down

  end
end
