class ShoppingCartController < ApplicationController

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

  def index
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @cart,
        description: @cart,
        images: ['cl_image_tag @cart.reel_pic.key'],
        amount: @cart,
        currency: 'aud',
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          cart_id: @cart,
          user_id: current_user.id
        }
      },
      success_url: "#{root_url}payments/success/#{@cart}",
      cancel_url: "#{root_url}reels"
    )
    @session_id = @session.id
  end

end
