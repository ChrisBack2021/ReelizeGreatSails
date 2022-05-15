class ShoppingCartController < ApplicationController
  def index
    @reel = Reel.find(params[:id])

  end

  # adds to cart and converts param_id string to integer
  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  # removes from cart and converts param_id string to integer
  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

end
