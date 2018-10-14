class SessionsController < ApplicationController
    before_action :authenticate!, only: [ :destroy ]
  def new
  end

  def create
    admin_user = AdminUser.find_by(email: params[:session][:email])
    if admin_user && admin_user.authenticate(params[:session][:password])
      session[:admin_user_id] = admin_user.id
      redirect_to '/reg_users'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to '/'
    end
  end

  def destroy
    current_user == nil
    session[:admin_user_id] = nil
    redirect_to '/'

  end
end
