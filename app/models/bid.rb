class Bid < ActiveRecord::Base
	belongs_to :offer
	belongs_to :user
	validates_inclusion_of :placed_by, :in => 1..2, :message => "can only be 1 or 2."

  # Indicates if user created a bid or the system with the help of automatic bidding
  PLACED_BY_USER = 1
  PLACED_BY_SYSTEM = 2
end
