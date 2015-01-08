class ProvidersController < ApplicationController

  hobo_model_controller

  auto_actions :all
  auto_actions_for :service, :create

  def up_down_vote
	  @provider = Provider.find(params[:id])
	  find_or_create_like_unlike @provider
	  render :layout => false
	  # redirect_to service_path(@provider.service)
	end

	def find_or_create_like_unlike provider
		# binding.pry
		unless provider.votes.where(:voter_id =>current_user.id,:vote_flag => true).blank?
	  	provider.vote_by :voter => current_user, :vote => 'bad'
	  else
	  	provider.vote_by :voter => current_user, :vote => 'like'
	  end
	end

end
