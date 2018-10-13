class AdminUsersController < ApplicationController

  attr_accessor :id, :name

  def index
		@admin_users = AdminUser.all
	end

	def show
		@admin_users = AdminUser.all
	end

  def new
      @admin_users = AdminUser.all
      render :login
	end
end

