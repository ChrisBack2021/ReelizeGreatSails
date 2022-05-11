class Reel < ApplicationRecord
  belongs_to :reel_type
  belongs_to :brand

  has_one_attached :reel_pic
end
