class Bid < ActiveRecord::Base
	belongs_to :offer
	belongs_to :user
	validates_inclusion_of :placed_by, :in => 1..2, :message => "can only be 1 or 2."
end
