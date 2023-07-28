class HomesController < ApplicationController
    before_action :authenticate_user!
    def index
        @photos = Photo.includes(:user).all
    end
  
    
      
  end
  