class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
        @deus = User.page(params[:page]).per(5)
    end
    def like
        @user = User.find(params[:id])
        @deus = User.page(params[:page]).per(5)
    end
end
