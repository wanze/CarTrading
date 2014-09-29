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

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
        if resource.is_a?(AdminUser)
          admin_dashboard_path
        else
          users_index_path
        end
  end

  # Twitter
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
