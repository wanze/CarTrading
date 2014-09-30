class WelcomeController < OffersController #dirty hack
  def index
      #dirty hack
      super.index

      # show offers by default when logged in
      if current_user.present?
        render 'offers/index'
      end
  end
end
