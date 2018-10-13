class SessionsController < ApplicationController
  def new
  end

  def create
    admin_user = AdminUser.find_by(email: params[:session][:email])
    if admin_user && admin_user.authenticate(params[:session][:password])
      session[:admin_user_id] = admin_user.id
      redirect_to '/events'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to '/'
    end
  end

  def destroy
  end
end
