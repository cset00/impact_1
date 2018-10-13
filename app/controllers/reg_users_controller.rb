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
    	if @reg_user.save 
    		redirect_to '/reg_users/get'
    	end
	end

	  private

	  def create_params
	    params.require(:reg_user).permit(:first_name, :last_name, :email, :school, :suburb, :contact_num)
	  end

end
