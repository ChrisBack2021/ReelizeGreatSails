class ProfilesController < ApplicationController

  # Shows current profile info
  def index
    @profile = current_user.profile
  end

  
end
