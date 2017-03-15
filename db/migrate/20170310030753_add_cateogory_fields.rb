class AddCateogoryFields < ActiveRecord::Migration[5.0]
  def self.up

    add_column :categories, :c_name, :string
    add_column :categories, :num_of_act, :integer

  end
end
