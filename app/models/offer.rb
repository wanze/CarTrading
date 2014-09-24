class Offer < ActiveRecord::Base
  belongs_to :car
  has_many :bids
end
