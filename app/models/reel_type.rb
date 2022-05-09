class ReelType < ApplicationRecord
  has_many :reels

  def reel_types
    return "#{reel_type}"
  end
end
