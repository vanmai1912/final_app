class HomesController < ApplicationController
    before_action :authenticate_user!
  
    def index
        following_user_ids = current_user.followings.pluck(:id)
        @photos= Photo.includes(:user).where(user_id: following_user_ids).where(is_active: true)
    end

    def discover_index
        following_user_ids = [current_user.id] + current_user.followings.pluck(:id)
        @photos = Photo.includes(:user).where.not(user_id: following_user_ids).where(is_active: true)
        render 'homes/index'
    end

  
    def show 
        following_user_ids = current_user.followings.pluck(:id)
        @albums = Album.includes(:user, :photos).where(user_id: following_user_ids).where(is_active: true)

    end

    def discover_show
        following_user_ids = [current_user.id] + current_user.followings.pluck(:id)
        @albums = Album.includes(:user, :photos).where.not(user_id: following_user_ids).where(is_active: true)
        render 'homes/show'
    end
   

      
  end
  