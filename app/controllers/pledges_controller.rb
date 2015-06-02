class PledgesController < ApplicationController
	before_action :authenticate_user!
  	before_action :set_project
  	before_action :set_reward

  	def index
  	end

  	def new
  		@pledge = current_user.user_pledges.build
  		@rewards = @project.rewards
  	end

  	def checkout
  		@reward = @project.rewards.find_by_name(order_params[:reward])
  		#@pledge = current_user.user_pledges.build(reward:@reward, amount:)
  	end

  	private
  	
  	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_reward
	    @reward = @project.rewards.find_by_id(params[:reward])
	end

	def order_params
		params.require(:user_pledge).permit(:reward)
	end
end
