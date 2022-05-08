class Brand < ApplicationRecord
  has_many :reels

  def brand
    return "#{brand}"
  end
end
