class ApplicationController < ActionController::Base
  include SessionsHelper
  def authenticate!
    redirect_to "/" unless session[:admin_user_id]
  end
end
