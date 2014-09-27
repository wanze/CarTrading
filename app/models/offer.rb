class Offer < ActiveRecord::Base
  belongs_to :car
  has_many :bids
  has_many :bid_settings

  # Find offers based on filters
  def self.filter(params)
    wheres = {}
    if params[:type].present?
      wheres.merge!('cars.type_id' => params[:type])
    end
    if params[:color].present?
      wheres.merge!('cars.color_id' => params[:color])
    end
    if params[:brand].present?
      wheres.merge!('cars.brand_id' => params[:brand])
    end

    self.where('end >= :now', :now => Time.now).joins(:car).where(wheres)
  end

  # Return the current highest bid by price of this offer
  def get_highest_bid
    self.bids.order('price DESC').first
  end

  # Return the highest price among all bids for this offer
  def get_highest_price
    highest_bid = self.get_highest_bid
    if highest_bid.nil?
      0
    else
      highest_bid.price
    end
  end

  # Return the min amount a user has to bid
  def get_min_bid_amount
    (self.get_highest_price + self.minimum_step).to_f
  end

  # Check if offer is still active
  def is_active
    Time.now <= self.end
  end

end
