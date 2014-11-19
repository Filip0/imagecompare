class FavouritesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  def index
    @favourites = Favourite.where(user: current_user)
    respond_with(@favourites)
  end


  def favourite
    image = Image.find(params[:id])
    @favourite = Favourite.create(user: current_user, image: image)

    respond_to do |format|
      if @favourite.save
        format.js
      else
        format.js
      end
    end
  end


  private
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    def favourite_params
      params.require(:favourite).permit(:user_id, :image_id)
    end
end
