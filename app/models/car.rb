class Car < ActiveRecord::Base
	validates :brand, presence: true
	validates :type, presence: true
	validates :color, presence: true
	validates :age, presence: true
	validates :mileage, presence: true
	validates :title, presence: true
	
  belongs_to :user
  belongs_to :brand
  belongs_to :type
  belongs_to :color #could also be many to many...
  has_many :offers

  mount_uploader :image, ImageUploader

  before_destroy :check_for_offers

  def check_for_offers
    if offers.any?
      errors.add(:id,'Cannot removed a offered car.')
      return false
    else
      return true
    end
  end

end
