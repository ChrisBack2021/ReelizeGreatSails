class AddBrandRefToReels < ActiveRecord::Migration[7.0]
  def change
    add_reference :reels, :brand, null: false, foreign_key: true
  end
end
