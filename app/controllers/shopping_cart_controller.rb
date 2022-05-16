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
session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
          name: 'ReelizeGreatSails',
          description: "ReelizeGreatSails",
          amount: (@cart),
          currency: 'aud',
          quantity: 1,
        }],
        payment_intent_data: {
          metadata: {
            order_id: @cart.id,
            user_id: current_user.id
          }
        },
        success_url: "#{root_url}payments/success?orderId=#{@cart.id}",
        cancel_url: "#{root_url}order_menu_items"
      )
      @session_id = session.id
  end

end
