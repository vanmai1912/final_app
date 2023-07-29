class HomesController < ApplicationController
    before_action :authenticate_user!
    def index
        @photos = Photo.includes(:user).left_outer_joins(:albums).where(albums: { id: nil })
    end
  
    def show 
        @albums = Album.includes(:user, :photos).all
    end

      
  end
  