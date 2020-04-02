class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
    else
      render :new, alert: "Check username and password."
    end
  end

  def destroy
    session.clear
  end
end
