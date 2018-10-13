class AdminUsersController < ApplicationController
    
  def login
    
    render :login
  end

  def signup
    render :signup
  end

  # def session
  #   admin = AdminUser.find_by(email: params[:email])
  #   if admin && admin.authenticate(params[:passoword])
  #       session[:admin_id] = admin.id
  #       redirect_to '/events'
  #   else
  #       render :login
  #   end
  # end

  # def delete_session
  #   session[:admin_id] = nil
  #   redirect_to '/login'
  # end
  
end