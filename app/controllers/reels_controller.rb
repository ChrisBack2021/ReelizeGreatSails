class ReelsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :check_user
  before_action :set_reel, only: [:show, :edit, :update, :destroy]
  before_action :set_brand_reel_type, only: [:new, :edit, :create, :update]

  def new
    @reel = Reel.new
    set_brand_reel_type
  end

  # Creating new reel, has to pass validation.
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

    # Creating a stripe session for payment
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @reel.item_name,
        description: @reel.description,
        amount: @reel.price,
        currency: 'aud',
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          reel_id: @reel.id,
          user_id: current_user.id
        }
      },
      success_url: "#{root_url}payments/success?reelId=#{@reel.id}",
      cancel_url: "#{root_url}reels"
    )
    @session_id = @session.id
  end

  def edit
    unless current_user.id == @reel.user_id or current_user.id == 1
      redirect_to reels_path, alert: "Only the owner or admin are allowed to perform that action."
    end
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
     unless current_user.id == @reel.user_id or current_user.id == 1
      redirect_to reels_path, alert: "Only the owner or admin are allowed to perform that action."
    end
    @reel.reel_pic.purge
    @reel.destroy
    redirect_to reels_path
  end


private
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
    params.require(:reel).permit(:item_name, :size, :description, :price, :item_condition, :brand_id, :reel_type_id, :reel_pic, :user_id)
  end

end
