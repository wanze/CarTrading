class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :update, :destroy, :edit]

  # GET /offers
  # GET /offers.json
  def index

    # Check if offers must be filtered
    if params.count > 0
      @offers = Offer.filter(params)
    else
      # No filter active, but display only active offers!
      @offers = Offer.where(:end <= Time.now)
    end
    @brands = Brand.all
    @colors = Color.all
    @types = Type.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @bid_setting = BidSetting.where(:user_id => current_user.id, :offer_id => @offer.id).first
    if @bid_setting.nil?
      @bid_setting = BidSetting.new
    end
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    @cars = Car.where(:user_id => current_user.id)
  end

  # GET /offers/1/edit
  def edit
    @cars = Car.where(:user_id => current_user.id)
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:car_id, :start, :end, :price, :minimum_step, :contact_details)
      # params.permit(:car_id, :start, :end, :price, :minimum_step, :contact_details)
    end
end
