class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile
  before_action :set_profile, except: [:index]

  
  # Shows current profile info
  def index
    @profiles = Profile.all
  end

  def edit
    unauthorised_profile
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path
  end

  def show
    unauthorised_profile
  end

  def destroy
    if @profile.user_id == current_user.id || current_user.id == 1
      @profile.destroy!
      if !current_user.has_role? :admin
        session.clear
        redirect_to root_path 
      end
    else
      unauthorised_profile
    end
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
