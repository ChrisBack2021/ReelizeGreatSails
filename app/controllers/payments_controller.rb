class PaymentsController < ApplicationController

 
  def success
    reelid = params[:reel_id]
    Reel.find(reelid).destroy
  end



  end