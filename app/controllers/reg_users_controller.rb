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
		@reg_user.active_sub = true
        if @reg_user.save 
            RegUserMailer.welcome_email(@reg_user).deliver_later
            @message = "Thanks for signing up as a volunteer #{@reg_user.first_name}, be sure to check your emails to keep up to date with our latest events."
    		render :template => 'homepage/index'
        else
            render :new
        end
	end

	  private

	  def create_params
	    params.require(:reg_user).permit(:first_name, :last_name, :email, :school, :suburb, :contact_num)
	  end

end
