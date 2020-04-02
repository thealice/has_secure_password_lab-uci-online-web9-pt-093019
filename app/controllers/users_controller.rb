class UsersController < ApplicationController

    def welcome
            user = User.find_by(id: session[:user_id])
            if user
                @name = user.name
            else
                @name = "Guest"
            end
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
           render :new, alert: "Signup Failed. Make sure you've filled out all fields."
        end

    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
