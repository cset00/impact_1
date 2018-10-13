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
    @admin_user = AdminUser.new
    @admin_user.email = params[:email]

    if @admin_user.save
      session[:admin_id] = @admin_user.id
      redirect_to '/events'
    else
      render :new
    end
  end

  private
  def admin_user_create_params
      params.require(:admin_user).permit(:email, :password)
  end
end



