class CreateReelTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :reel_types do |t|
      t.string :reel_type

      t.timestamps
    end
  end
end
