class SessionsController < ApplicationController
  def new
  end

  def create
    admin_user = AdminUser.find_by(email: params[:session][:email].downcase)
    if admin_user && admin_user.authenticate(params[:session][:password])
      session[:admin_user_id] = admin_user.admin_user_id
      redirect_to '/events'
    else
      flash[:notice] = 'Invalid email/password combination'
      redirect_to '/sessions/new'
    end
  end

  def destroy
    current_user == nil
    session[:admin_user_id] = nil
    flash.discard(:notice) 
    redirect_to '/'
  end
  

end