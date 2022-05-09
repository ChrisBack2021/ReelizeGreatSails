class Brand < ApplicationRecord
  has_many :reels

  def brand_name
    return "#{brand}"
  end

end
