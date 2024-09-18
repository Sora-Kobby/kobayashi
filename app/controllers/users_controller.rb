class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @chats = @user.chats  
        

      end

end
