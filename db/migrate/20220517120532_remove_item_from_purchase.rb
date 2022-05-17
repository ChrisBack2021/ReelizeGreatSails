class RemoveItemFromPurchase < ActiveRecord::Migration[7.0]
  def change
    remove_column :purchases, :item, :string
  end
end
