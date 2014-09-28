class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  # secure controller actions, they are only accessible by an authenticated user
  before_action :authenticate_user!

  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.where(:user_id => current_user.id)
      .group("offer_id")
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids
  # POST /bids.json
  def create
    @offer = Offer.find(params[:offer_id])
    if @offer.nil?
      redirect_to 'offers/index', alert: 'Offer not found'
    end
    if !@offer.is_active
      redirect_to 'offers/index', alert: 'Offer no longer available'
    end
    amount = params[:amount].to_f # Cast to float
    if amount < @offer.get_min_bid_amount
      redirect_to @offer, notice: 'The entered amount is too small'
    else
      @bid = Bid.new
      @bid.user_id = current_user.id
      @bid.offer_id = @offer.id
      @bid.price = amount
      @bid.placed_by = Bid::PLACED_BY_USER
      @bid.timestamp = Time.now
      if @bid.save
        redirect_to @offer, notice: "You're bid was successfully placed"
      else
        redirect_to @offer, alert: 'Could not create bid'
      end
    end


    # respond_to do |format|
    #   if @bid.save
    #     format.html { redirect_to @bid, notice: 'Bid was successfully created.' }
    #     format.json { render :show, status: :created, location: @bid }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @bid.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to bids_url, notice: 'Bid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:user_id, :offer_id, :placed_by, :timestamp, :price)
    end
end
