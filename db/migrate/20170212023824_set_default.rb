class SetDefault < ActiveRecord::Migration[5.0]
  def self.up
    change_column :activities, :total_time, :integer, :default => 0
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end

end
