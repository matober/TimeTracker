class AddPriorityToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :priority, :integer
  end
end
