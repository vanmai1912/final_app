class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy ]

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos.all
  end

  def new
    @album = Album.new
    
  end

  def edit
  end


  def create
    @album = current_user.albums.new(album_params)

    if @album.save
      save_photos
      redirect_to @album, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
      @album = Album.find(params[:id])
      if @album.update(album_params)
        save_photos
        redirect_to album_path
      else
        render :edit
      end
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
  
  end

  private
  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :is_active, :des)
  end


  def save_photos
    valid_images = params[:album][:images].reject(&:blank?)
    unless valid_images.blank?
      valid_images.each do |image|
        @album.photos.create(image: image, user_id: @album.user_id)
      end
    end
  end
 

    
end
