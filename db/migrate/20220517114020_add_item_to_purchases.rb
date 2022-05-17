class AddItemToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :purchases, :item, :string
  end
end
