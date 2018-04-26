class AddCancelledToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :cancelled, :boolean, default: false
  end
end
