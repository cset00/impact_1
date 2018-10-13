class RegUsersController < ApplicationController

	def index
		@reg_users = RegUser.all
	end

	def show
		@reg_users = RegUser.all
	end

	def new
	end

end
