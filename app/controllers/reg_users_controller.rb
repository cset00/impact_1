class RegUsersController < ApplicationController

	def index
		@reg_users = RegUser.all
	end

	def show
	end

	def new
	end

end
