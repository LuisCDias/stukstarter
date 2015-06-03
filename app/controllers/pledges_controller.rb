class PledgesController < ApplicationController
	before_action :authenticate_user!
  	before_action :set_project
  	before_action :set_reward
  	before_action :set_pledge, except: [:index, :new]

  	def index
  		@pledges = @project.rewards.flat_map(&:user_pledges)
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

  	def show
  		respond_to do |format|
	      format.html
	    end
  	end

  	private
  	
  	def set_project
		@project = Project.friendly.find(params[:project_id])
	end

	def set_reward		
		id = params[:user_pledge] ? pledge_params[:reward_id] : params[:reward_id]
	    @reward = @project.rewards.find_by_id(id)
	end

	def set_pledge
		@pledge = UserPledge.friendly.find(params[:id])
	end

	def pledge_params
		params.require(:user_pledge).permit(:reward_id, :amount)
	end
end
