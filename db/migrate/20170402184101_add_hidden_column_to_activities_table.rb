class AddHiddenColumnToActivitiesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :hidden, :boolean, default: 0
  end
end
