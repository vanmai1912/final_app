class UsersController < ApplicationController
    before_action :find_user
    def view_user
        
    end

    def view_user_album
        
    end

    def view_user_follower
    
    end

    def view_user_following
    
    end

    def user_follow
        follow = Follow.new(follower: current_user, following: User.find(params[:user_id]))
        if follow.save
           redirect_to view_user_follower_path
        end

    end

    def user_unfollow
        follow = Follow.find_by(follower: current_user, following_id: User.find(params[:user_id]))
        if follow.destroy
            redirect_to view_user_following_path
        end
    end



    private

        def find_user
            @user = User.includes(:albums, :photos, :followers, :followings).find(params[:id])
            @photos = Photo.left_outer_joins(:albums).where(user_id: @user.id, albums: { id: nil })
            @photos_pub = Photo.left_outer_joins(:albums).where(user_id: @user.id, albums: { id: nil }, is_active: true)
            @albums = @user.albums.all
            @albums_pub = @user.albums.where(is_active: true)
            @followers = @user.followers
            @followings = @user.followings
        end

end
