class Reel < ApplicationRecord
  belongs_to :reel_type
  belongs_to :brand
end
