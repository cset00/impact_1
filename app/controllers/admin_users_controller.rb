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
  end
 end

