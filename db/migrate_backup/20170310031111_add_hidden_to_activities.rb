class AddHiddenToActivities < ActiveRecord::Migration[5.0]
  def self.up
    add_column :activities, :hidden, :boolean
  end
end
