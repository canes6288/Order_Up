class AddSoldOutToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :sold_out, :boolean
  end
end
