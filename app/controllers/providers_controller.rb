class ProvidersController < ApplicationController

  hobo_model_controller

  auto_actions :all
  auto_actions_for :service, :create

  def upvote
	  @provider = Provider.find(params[:id])
	  @provider.vote_by :voter => current_user, :vote => 'like'
	  redirect_to service_path(@provider.service)
	end

	def downvote
	  @provider = Provider.find(params[:id])
	  @provider.vote_by :voter => current_user, :vote => 'bad'
	  redirect_to service_path(@provider.service)
	end

end
