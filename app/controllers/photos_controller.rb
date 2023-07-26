class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /photos or /photos.json
  def index
    @photos = current_user.photos.all
  end

  # GET /photos/1 or /photos/1.json
  def show
    @photo = Photo.find(params[:id])
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos or /photos.json
  def create

    @photo = current_user.photos.new(photo_params)

    if @photo.save
      redirect_to @photo, notice: "Photo was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    
    @photo = Photo.find(params[:id])

    # Xử lý ảnh mới (nếu có)
    if params[:photo][:avatar].present?
      @photo.avatar = params[:photo][:avatar]
    end

    if @photo.update(photo_params)
      redirect_to @photo, notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    def set_photo
      @photo = Photo.find(params[:id])
    end


    def photo_params
      params.require(:photo).permit(:name, :des, :is_active, :avatar)
    end
end
