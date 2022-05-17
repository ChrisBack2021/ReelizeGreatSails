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
      items = []
      session[:cart].each do |id|
        list_item = Reel.find(id)
        items.push({ name: list_item.item_name, description: list_item.description, amount: (list_item.price)*100, currency: 'aud', quantity: 1 })
      end

        #name: "#{@reel.brand.brand} #{@reel.item_name}",
        #description: @reel.description,
        #amount: (@reel.price)*100,
        #currency: 'aud',
        #quantity: 1

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: items,
        payment_intent_data: {
          metadata: {
            # order_id: @cart.id,
            user_id: current_user.id
          }
        },
        success_url: "#{root_url}payments/success",
        cancel_url: "#{root_url}order_menu_items"
      )
      @session_id = session.id
  end

end
