class RegUsersController < ApplicationController

	def index
		@reg_users = RegUser.all
	end

	def show
		@reg_users = RegUser.all
	end

	def new
	end

	def create
		@user = RegUser.new(create_params)
    	@user.save
	end

	  private

	  def create_params
	    params.require(:event).permit(:date_timeaddress, :subject, :description)
	  end

end
