class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|

      t.integer :total_time
      t.string :name
      t.datetime :date

      t.timestamps
    end
  end


end
