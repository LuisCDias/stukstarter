class PledgesController < ApplicationController
	before_action :authenticate_user!
  	before_action :set_project
  	before_action :set_reward

  	def index
  		respond_to do |format|
	      format.html
	    end
  	end

  	def new
  		@pledge = current_user.user_pledges.build
  		@rewards = @project.rewards
  		respond_to do |format|
	      format.html
	    end
  	end

  	def checkout
  		@amount = pledge_params[:amount].to_i
  		@pledge = current_user.user_pledges.build(reward:@reward, amount:@amount)
  		@rewards = @project.rewards

  		respond_to do |format|
  			if @reward && @amount.present? && @reward.value <= @amount
  				format.html
  			else
  				if @amount.present?  				
  					flash.now[:error] = "The amount must have a value greater or equal to the reward"
  				else
  					flash.now[:error] = "You must provide an amount"
  				end
  				format.html { render :new}
  			end			
	    end
  	end

  	private
  	
  	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_reward		
	    @reward = @project.rewards.find_by_id(pledge_params[:reward]) if params[:user_pledge]
	end

	def pledge_params
		params.require(:user_pledge).permit(:reward, :amount)
	end
end
