class Bid < ActiveRecord::Base
	belongs_to :offer
	belongs_to :user
	validates_inclusion_of :placed_by, :in => 1..2, :message => "can only be 1 or 2."
  validate :user_cannot_bid_on_own_offer

  # Indicates if user created a bid or the system with the help of automatic bidding
  PLACED_BY_USER = 1
  PLACED_BY_SYSTEM = 2

  def user_cannot_bid_on_own_offer
    if not Car.where('id=? AND user_id=?',self.offer.car_id,self.user_id).empty?
      errors.add(:user_id,"owner of a car cannot bid on his own offer")
    end
  end
end
