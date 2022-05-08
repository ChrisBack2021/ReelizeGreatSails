class ReelsController < ApplicationController

  def index
    @reels = Reel.all
  end
  
  def show
    @reel = Reel.find(params[:id])
  end


end
