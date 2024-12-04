class SessionsController < ApplicationController
  def new
    # Renders the login form
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back, #{user.name}!"
    else
      flash.now[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    # Log out the user by clearing the session
    session[:user_id] = nil

    # Redirect to the root path or wherever you want after logout
    redirect_to root_path, notice: "You have been logged out."
  end
end