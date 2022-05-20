class ReelsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :check_user, :initialize_wish_list, :wish_list
  before_action :set_reel, only: [:show, :edit, :update, :destroy]
  before_action :set_brand_reel_type, only: [:new, :edit, :create, :update]


  def wish_list_delete
    id = params[:id]
    session[:wish_list].delete(id)   
  end

  # The #new method creates a new record in the database. In this case, a new record in Reel database. The #new is the same as the INSERT query in postgresql.
  def new
    @reel = Reel.new
    set_brand_reel_type
  end

  #Creates a new reel with the values that were given in the form. The form includes the reel_params and sanitizes it. The #new is the same as the INSERT query in postgresql.
  def create
    @reel = Reel.new(reel_params)
    @reel.user_id = current_user.id
    @reel.save
    if @reel.valid?
      redirect_to @reel
    else
      flash.now[:alert] = @reel.errors.full_messages.join('<br>')
      render 'new'
    end
  end

  
  # Displays all the records in the Reels database. In postgresql, the syntax is SELECT * from, the asterisk means select all.
  def index
    @reels = Reel.all
  end
  
  # Shows each individual reel
  def show
    # Creating a stripe session for payment
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: "#{@reel.brand.brand} #{@reel.item_name}",
        description: @reel.description,
        amount: (@reel.price)*100,
        currency: 'aud',
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          reel_id: @reel.id,
          user_id: current_user.id
        }
      },
      success_url: "#{root_url}payments/success/#{@reel.id}",
      cancel_url: "#{root_url}reels"
    )
    @session_id = @session.id
    wish_list_delete
  end

  
  def edit
    unauthorised_reel
  end

  # Postgresql syntaxt for updating a record in the database is UPDATE.
  def update
    begin
      @reel.update(reel_params)
      redirect_to @reel
    rescue
      flash.now[:alert] = @reel.errors.full_messages.join!('<br>')
    render 'edit'
    end
  end


  # Destroys one particular reel and removes pic.
  def destroy
    if @reel.user_id == current_user.id || current_user.id == 1
      @reel.reel_pic.purge
      wish_list_delete
      @reel.destroy
      redirect_to root_path
    else
      unauthorised_reel
    end
  end

 def add_to_wish_list
    id = params[:id]
    session[:wish_list] << id unless session[:wish_list].include?(id)
    redirect_to root_path
  end

  def remove_from_wish_list
    wish_list_delete
    redirect_to root_path
  end


private
  def check_user
    authorize Reel
  end

  # Searches database for the reel. How it searches the database is through the id given by the params. It matches it up with the reel_id in the database. In Postgresql syntax, the query is SELECT.
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
