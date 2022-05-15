class CheckoutController < ApplicationController
  def create

    reel = Reel.find(params[:id])

    if @reel.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: reel.item_name,
        description: reel.description,
        amount: reel.price,
        currency: 'aud',
        quantity: 1
      }],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js #renders create.js.erb rather than html.erb
    end
  end

  def success
  end

  def cancel
  end

end