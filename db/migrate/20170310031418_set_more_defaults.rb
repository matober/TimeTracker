class SetMoreDefaults < ActiveRecord::Migration[5.0]
  def self.up
    change_column :activities, :hidden, :boolean, :default => FALSE
    change_column :categories, :num_of_act, :integer, :default => 0
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
