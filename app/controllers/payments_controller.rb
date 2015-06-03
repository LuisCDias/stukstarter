class PaymentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_project
	before_action :set_reward
  before_action :set_amount
  before_action :set_client_token

	def new
		@pledge = current_user.user_pledges.build(payment_params)
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
    @pledge = current_user.user_pledges.build(payment_params)
    
    respond_to do |format|
      if @pledge.valid?
        @pledge.save
        result = Braintree::Customer.create( 
          :email => current_user.email, 
          :payment_method_nonce => params[:payment_method_nonce] 
        )
        if result.success?
          current_user.update(customer_id: result.customer.id)
          format.html { redirect_to project_pledge_path(@project,@pledge), notice: "Your pledge was successfully created." }
        else
          flash.now[:error] = result.errors.map(&:message)
          format.html {render :new }
        end        
      else
        flash.now[:error] = "Pledge is invalid"
        format.html {render :new }
      end     
    end
	end

	private
	
	def set_project
    @project = Project.friendly.find(params[:project_id])
	end

  def set_amount
    @amount = payment_params[:amount].to_i
  end

	def set_reward		
		id = params[:user_pledge] ? payment_params[:reward_id] : params[:reward_id]
    @reward = @project.rewards.find_by_id(id)
	end

  def set_client_token
    @client_token = Braintree::ClientToken.generate(:customer_id => current_user.customer_id)
  end

	def payment_params
		params.require(:user_pledge).permit(:reward_id, :name, :amount, :address, :city, :country, :postal_code)
	end
end
