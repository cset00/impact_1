class RegUsersController < ApplicationController

	def index
		@reg_users = RegUser.all
	end

	def show
		@reg_users = RegUser.all
	end

	def new
		@reg_user = RegUser.new
	end

	def create
		@reg_user = RegUser.new(create_params)
    	@reg_user.save
	end

	  private

	  def create_params
	    params.require(:event).permit(:date_timeaddress, :subject, :description)
	  end

end
