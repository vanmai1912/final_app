class UsersController < ApplicationController
    before_action :find_user
    def view_user
        
    end

    def view_user_album
        
    end

    def view_user_follower
    
    end



    private
        def find_user
            @user = User.includes(:albums, :photos, :followers, :followings).find(params[:id])
            @photos = Photo.left_outer_joins(:albums).where(user_id: @user.id, albums: { id: nil })
            @albums = @user.albums.all
            @followers = @user.followers
            @followings = @user.followings
        end

end
