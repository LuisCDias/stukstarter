class ChargePledgesJob < ActiveJob::Base
  queue_as :default

  def perform(project_id)
  	@project = Project.find(project_id)
  	if @project.funded?
  		@project.pledges.each do |pledge|
  			pledge.charge! unless pledge.charged?
  		end
  	end
  end
end
