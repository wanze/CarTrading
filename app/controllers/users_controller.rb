class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users/index
  def index
  end

  # GET /users/offers
  def offers
    @cars = Car.select(:id).where(user_id: current_user.id)

    # dirty hack, don't know if this is valid sql: select field as f1, * from bla
    @offers = Offer.select("offers.id as oid, *")
      .joins(:car)
      .where('"end" >= ? AND car_id IN (?) ',DateTime.now,@cars)

    # correct wrong id number (because of the previous join....)
    @offers.each { |o| o.id = o.oid }

  end

  # GET /users/passed_offers
  def passed_offers
    @cars = Car.select(:id).where(user_id: current_user.id)

    # dirty hack, don't know if this is valid sql: select field as f1, * from bla
    @offers = Offer.select("offers.id as oid, *")
    .joins(:car)
    .where('"end"" < ? AND car_id IN (?) ',DateTime.now,@cars)

    # correct wrong id number (because of the previous join....)
    @offers.each { |o| o.id = o.oid }

  end

end
