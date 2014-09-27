class WelcomeController < OffersController #dirty hack
  def index
      #dirty hack
      super.index
      render 'offers/index'
  end
end
