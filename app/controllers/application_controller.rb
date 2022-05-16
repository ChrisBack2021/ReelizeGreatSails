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

# For session based shopping cart
  def initialize_session
    session[:cart] ||= []
  end


  def shopping_cart
    @cart = Reel.find(session[:cart])
  end


end
