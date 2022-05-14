class ReelsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user
  before_action :set_reel, only: [:show, :edit, :update, :destroy]
  before_action :set_brand_reel_type, only: [:new, :edit, :create, :update]
  before_action :initialize_session
  before_action :shopping_cart


  def new
    @reel = Reel.new
    set_brand_reel_type
  end

  def create
    @reel = Reel.create(reel_params)
    if @reel.valid?
      redirect_to @reel
    else
      flash.now[:alert] = @reel.errors.full_messages.join('<br>')
      render 'new'
    end
  end

  # Shows all reels
  def index
    @reels = Reel.all
  end
  
  # Shows each individual reel
  def show
    @reel = Reel.find(params[:id])
  end

  def edit
  end

    # Updates one particular reel
  def update
    begin
      @reel.update!(reel_params)
      redirect_to @reel
    rescue
      flash.now[:alert] = @reel.errors.full_messages.join('<br>')
    render 'edit'
    end
  end

  # Destroys one particular reel and removes pic.
  def destroy
    @reel.reel_pic.purge
    @reel.destroy
    redirect_to reels_path
  end



  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end


private

  def initialize_session
    session[:cart] ||= []
  end

  
  def shopping_cart
    @cart = Reel.find(session[:cart])
  end

  def check_user
    authorize Reel
  end


  # Uses params id to find a reel
  def set_reel
    @reel = Reel.find(params[:id])
  end

  # Brand/reel type is ordered for when updating/creating new listing.
  def set_brand_reel_type
    @brands = Brand.order(:brand)
    @reel_types = ReelType.order(:reel_type)
  end

  # Strong params to stop sql injections
  def reel_params
    params.require(:reel).permit(:item_name, :size, :description, :price, :item_condition, :brand_id, :reel_type_id, :reel_pic)
  end

end
