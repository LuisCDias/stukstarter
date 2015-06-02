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

  	private
  	
  	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_reward		
		id = params[:user_pledge] ? pledge_params[:reward] : params[:reward]
	    @reward = @project.rewards.find_by_id(id)
	end

	def pledge_params
		params.require(:user_pledge).permit(:reward, :amount)
	end
end
