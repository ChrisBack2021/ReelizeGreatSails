class ReelsController < ApplicationController
  before_action :set_reel, only: [:show, :edit, :update, :destroy]
  before_action :set_brand_reel_type, only: [:new, :edit]

  def new
    @reel = Reel.new
    set_brand_reel_type
  end

  def create
    @reel = Reel.create(reel_params)
    redirect_to @reel
  end

  def index
    @reels = Reel.all
  end
  
  def show
    @reel = Reel.find(params[:id])
  end

  def edit
    set_brand_reel_type
  end

  def update
    @reel.update(reel_params)
    redirect_to @reel
  end

  def destroy
    @reel.destroy
    redirect_to reels_path
  end


private
  def set_reel
    @reel = Reel.find(params[:id])
  end

  def set_brand_reel_type
    @brands = Brand.order(:brand)
    @reel_types = ReelType.order(:reel_type)
  end

  def reel_params
    params.require(:reel).permit(:item_name, :size, :description, :price, :item_condition, :brand_id, :reel_type_id)
  end

end
