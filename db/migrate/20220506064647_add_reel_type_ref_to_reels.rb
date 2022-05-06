class AddReelTypeRefToReels < ActiveRecord::Migration[7.0]
  def change
    add_reference :reels, :reel_type, null: false, foreign_key: true
  end
end
