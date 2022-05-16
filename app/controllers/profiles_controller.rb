class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile
  before_action :set_profile, only: [:show, :update, :edit]

  
  # Shows current profile info
  def index
    @profiles = Profile.all
  end

  def edit
    unauthorised_entry
  end

  def update
    @profile.update(profile_params)
    redirect_to profiles_path
  end

  def show
    unauthorised_entry
  end

  private

  def check_profile
    authorize Profile
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.permit(:first_name, :last_name, :age)
  end

end
