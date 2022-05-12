class ProfilesController < ApplicationController

  # Shows current profile info
  def index
    @profile = current_user.profile
  end

  def create
  end

  def edit
     @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)
    redirect_to profiles_path
  end


  private
  def profile_params
    params.permit(:first_name, :last_name, :age)
  end

end
