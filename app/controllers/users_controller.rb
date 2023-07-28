class UsersController < ApplicationController
    def view_user
        @user = User.find(params[:id])
        @photos = @user.photos.all
    end

end
