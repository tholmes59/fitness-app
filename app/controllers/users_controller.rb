class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect to root_path
        else
            render :new
        end
    end

    def show 
        @user = User.find(params[:id])
    end

    def index
        @user = User.all 
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end


end
