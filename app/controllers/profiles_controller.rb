class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile
  # Shows current profile info
  def index
  end

  def create
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profiles_path
  end


  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.permit(:first_name, :last_name, :age)
  end

end
