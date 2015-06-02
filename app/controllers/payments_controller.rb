class PaymentsController < ApplicationController
	before_action :authenticate_user!
  	before_action :set_project
  	before_action :set_reward

  	def new
  		@amount = payment_params[:amount].to_i
  		@pledge = current_user.user_pledges.build(reward:@reward, amount:@amount)
  		@rewards = @project.rewards

  		respond_to do |format|
  			if @reward && @amount.present? && @reward.value <= @amount
  				format.html
  			else
  				if @amount.present?
  					flash[:error] = "The amount must have a value greater or equal to the reward"
  				else
  					flash[:error] = "You must provide an amount"
  				end
  				format.html { redirect_to new_project_pledge_path(reward: @reward)}
  			end			
	    end
  	end

  	def create
  	end

  	private
  	
  	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_reward		
		id = params[:user_pledge] ? payment_params[:reward] : params[:reward]
	    @reward = @project.rewards.find_by_id(id)
	end

	def payment_params
		params.require(:user_pledge).permit(:reward, :amount)
	end
end
