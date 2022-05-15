class AddUserRefToReels < ActiveRecord::Migration[7.0]
  def change
    add_reference :reels, :user, null: false, foreign_key: true
  end
end
