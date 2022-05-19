# class WishListsController < ApplicationController

#   def index
#     WishList.all
#   end

#   def create
#     WishList.create!(reel: Reel.find(params[:id]), profile: current_user.profile)
#     redirect_to reels_path
#   end


#   def destroy
#     destroy_reel = Reel.find(params[:id])
#     WishList.destroy(reel: Reel.find(params[:id]), profile: current_user.profile)
#     redirect_to reels_path
#   end
# end