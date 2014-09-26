class Offer < ActiveRecord::Base
  belongs_to :car
  has_many :bids
  has_many :bid_settings
end
