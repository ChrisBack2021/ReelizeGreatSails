class CreateReels < ActiveRecord::Migration[7.0]
  def change
    create_table :reels do |t|
      t.string :item_name
      t.integer :size
      t.string :description
      t.integer :price
      t.string :item_condition

      t.timestamps
    end
  end
end
