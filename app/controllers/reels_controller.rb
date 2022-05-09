class ReelsController < ApplicationController
  before_action :set_reel, only: [:show, :edit, :update]

  def index
    @reels = Reel.all
  end
  
  def show
    @reel = Reel.find(params[:id])
  end

  def edit
    @brands = Brand.order(:brand)
    @reel_types = ReelType.order(:reel_type)
  end

  def update
    @reel.update(reel_params)
    redirect_to @reel
  end


private
  def set_reel
    @reel = Reel.find(params[:id])
  end

  def reel_params
    params.require(:reel).permit(:item_name, :size, :description, :price, :item_condition, :brand_id, :reel_type_id)
  end

end
