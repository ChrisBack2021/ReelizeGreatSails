class Profile < ApplicationRecord
  belongs_to :user
  has_many :wish_lists, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, numericality: true 

end
