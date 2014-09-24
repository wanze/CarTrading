class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  # Custom check access filter
  # Checks before a controller action is called if the user is already logged in.
  # Otherwise the user is redirected to /users/sign_in
  #
  # You can use it in a controller like this:
  #
  #   before_filter :check_access, :only => :new
  #
  def check_access
    if not user_signed_in?
      redirect_to('/users/sign_in')
    end
  end


end
