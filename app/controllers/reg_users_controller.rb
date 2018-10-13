class RegUsersController < ApplicationController
    before_action :authenticate!, except: [ :unsubscribe, :new, :create ]

	def index
		@reg_users = RegUser.all
	end

	def show
		@reg_user = RegUser.find(params[:id])
	end

	def new
		@reg_user = RegUser.new
    end

    def edit
        @reg_user = RegUser.find(params[:id])
    end
    
    def update
        @reg_user = RegUser.find(params[:id])
        @reg_user.update_attributes(create_params)
        if @reg_user.save
            redirect_to reg_user_path(@reg_user.id)
        else
            render :edit
        end
    end
    
    def confirm_unsub
		@reg_user = RegUser.find(params[:id])
    end

    def unsub
        @reg_user = RegUser.find(params[:id])
        @reg_user.active_sub = false
        @reg_user.save
        redirect_to reg_user_path(@reg_user.id)
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
