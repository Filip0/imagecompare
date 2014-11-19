class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @favourites = Favourite.where(user: current_user).includes(:image).paginate(:page => params[:page], :per_page => 10)
    respond_with(@favourites)
  end


  def favourite
    image = Image.find(params[:id])
    @favourite = Favourite.find_by(user: current_user, image: image)
    if @favourite
      @favourite.destroy
    else
      @favourite = Favourite.create(user: current_user, image: image)
    end
    respond_to do |format|
      if @favourite.save
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_to favourites_path, notice: 'Favourite was successfully destroyed.' }
      format.json { head :no_content }
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
