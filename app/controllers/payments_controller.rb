class PaymentsController < ApplicationController

  def success
    id = params[:reel_id]
    Purchase.create(reel_id: id, user_id: current_user.id)
  end
  end