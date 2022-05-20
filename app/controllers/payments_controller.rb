class PaymentsController < ApplicationController

  # Creates a new record in the Purchase database that uses both foreign keys, reel_id and user_id. The postgresql syntax for creating new records in INSERT.
  def success
    id = params[:reel_id]
    Purchase.create(reel_id: id, user_id: current_user.id)
  end
  end