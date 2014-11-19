class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :upvote]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def top
    @favourites = Favourite.where(user: current_user)
    if params[:top]
      @images = Image.order(upvotes: :desc).limit(params[:top])
    else
      @images = Image.order(upvotes: :desc).limit(10)
    end
  end

  def upvote
    upvote = Upvote.create(user: current_user, image: @image)
    respond_to do |format|
      if upvote.save
        format.html {redirect_to(:compare)}
      else
        if user_signed_in?
          notice = 'Something went wrong, have you already voted for this image?'
        else
          notice = 'You need to sign in to vote on images'
        end
        format.html {redirect_to(:compare, notice: notice)}
      end
    end
  end

  def compare
    # Adds two different random images from the database to image1 and image2.
    offset1 = rand(Image.count)
    offset2 = rand(Image.count)

    rand1 = Image.offset(offset1).first
    rand2 = Image.offset(offset2).first
    while rand1 == rand2 do
      offset2 = rand(Image.count)
      rand2 = Image.offset(offset2).first
    end

    @image1 = rand1
    @image2 = rand2
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:url)
    end
end
