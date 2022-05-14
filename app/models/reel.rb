class Reel < ApplicationRecord
  belongs_to :reel_type
  belongs_to :brand
  
  has_one_attached :reel_pic

  validates :item_name, presence: true
  validates :price, presence: true, numericality: true 
  validates :item_condition, presence: true

end
