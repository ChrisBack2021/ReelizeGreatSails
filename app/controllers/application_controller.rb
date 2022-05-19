class ApplicationController < ActionController::Base
  include Pundit


rescue_from Pundit::NotAuthorizedError, with: :forbidden


private
# For flash message
  def forbidden
    flash[:alert] = "You are not authorized to attempt that action"
    redirect_to root_path
  end

  def unauthorised_profile
    unless current_user.id == @profile.user_id || current_user.id == 1
      redirect_to root_path, alert: "You are not authorized to perform that action"
    end
  end

  def unauthorised_reel
    unless current_user.id == @reel.user_id || current_user.id == 1
      redirect_to root_path, alert: "You are not authorized to perform that action"
    end
  end

# For wish list
  def initialize_wish_list
    session[:wish_list] ||= []
  end


  def wish_list
    @wish_list = Reel.find(session[:wish_list])
  end






end
