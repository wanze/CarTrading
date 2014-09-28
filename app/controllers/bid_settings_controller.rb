class BidSettingsController < InheritedResources::Base

  def save
    @offer = Offer.find(params[:offer_id])
    if @offer.nil?
      redirect_to 'offers/index', alert: 'Offer not found' and return
    end

    # Check if object must be created or updated
    bid_setting = BidSetting.where(:user_id => current_user.id, :offer_id => @offer.id).first
    if bid_setting.nil?
      bid_setting = BidSetting.new
      bid_setting.offer_id = @offer.id
      bid_setting.user_id = current_user.id
    end

    if params[:auto_bidding] == '1'
      # Auto bidding enabled. Check if Amount is okay
      max_amount = params[:max_amount].to_f
      if max_amount > @offer.get_min_bid_amount
        bid_setting.automatic = true
        bid_setting.max_amount = max_amount
      else
        redirect_to @offer, notice: 'Max amount must be at least CHF ' + @offer.get_min_bid_amount.to_s and return
      end
    else
      bid_setting.automatic = false
      bid_setting.max_amount = 0
    end

    if bid_setting.save
      redirect_to @offer, notice: 'Successfully saved Bid Settings'
    else
      redirect_to @offer, alert: 'Could not save Bid Settings'
    end
  end

end
