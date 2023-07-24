class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy ]

  # GET /albums or /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1 or /albums/1.json
  def show
    @album = Album.find(params[:id])
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums or /albums.json

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      if params[:album][:images].present?
        params[:album][:images].each do |image|
          @album.images.attach(image)
        end
        redirect_to @album, notice: 'Album was successfully created.'
      end
    else
      render :new
    end
  end

  # PATCH/PUT /albums/1 or /albums/1.json
  def update
 
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
  
  end

  private
  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :is_active, :des, images: [])
  end
    
end
