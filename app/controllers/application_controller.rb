class ApplicationController < ActionController::Base
  include Pundit
  before_action :initialize_session
  before_action :shopping_cart

rescue_from Pundit::NotAuthorizedError, with: :forbidden

private
  def forbidden
    flash[:alert] = "You are not authorized to attempt that action"
    redirect_to root_path
  end

  private

  def initialize_session
    session[:cart] ||= []
  end

  
  def shopping_cart
    @cart = Reel.find(session[:cart])
  end

end
