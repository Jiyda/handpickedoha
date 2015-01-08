class UsersController < ApplicationController

  hobo_user_controller

  auto_actions :all, :except => [ :index, :new, :create]
  

  # Normally, users should be created via the user lifecycle, except
  #  for the initial user created via the form on the front screen on
  #  first run.  This method creates the initial user.
  def create
    hobo_create do
      if valid?
        self.current_user = this
        flash[:notice] = t("hobo.messages.you_are_site_admin", :default=>"You are now the site administrator")
        redirect_to home_page
      end
    end
  end

  def my_favorites
    unless current_user.class == Guest
      @providers = Vote.where(:voter_id =>current_user.id,:vote_flag => true).map(&:provider)
      render :layout => "erb_layout"
    else
      redirect_to root_path
    end
  end

end
