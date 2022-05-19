class AddReelRefToWishLists < ActiveRecord::Migration[7.0]
  def change
    add_reference :wish_lists, :reel, null: false, foreign_key: true
  end
end
