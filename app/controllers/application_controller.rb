class ApplicationController < ActionController::Base
  include Pundit
  # For session based shopping cart
  before_action :initialize_session
  before_action :shopping_cart

rescue_from Pundit::NotAuthorizedError, with: :forbidden


private
# For flash message
  def forbidden
    flash[:alert] = "You are not authorized to attempt that action"
    redirect_to root_path
  end

  def unauthorised_profile
    unless current_user.id == @profile.id || current_user.id == 1
      redirect_to root_path, alert: "You are not authorized to perform that action"
    end
  end

  def unauthorised_reel
    unless current_user.id == @reel.user_id || current_user.id == 1
      redirect_to root_path, alert: "You are not authorized to perform that action"
    end
  end

# For session based shopping cart
  def initialize_session
    session[:cart] ||= []
  end


  def shopping_cart
    @cart = Reel.find(session[:cart])
  end

  def purchase_history
    @history = []
  end



end
