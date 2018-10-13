class AdminUsersController < ApplicationController

  def index
		@admin_users = AdminUser.all
	end

	def show
		@admin_users = AdminUser.all
	end

  def new
    @admin_users = AdminUser.all
  end
  
  def create


    if logged_in?
      redirect_to '/events'
    else
      redirect_to '/login'
    end
 
  end

  private
  def admin_user_create_params
      params.require(:admin_user).permit(:email, :password)
  end
end



