class SessionsController < ApplicationController
  before_filter :is_signed_in_user, only: [:new]

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      #sign_in user
      #redirect_back_or user
      session[:user_id] = user.id
      redirect_to next_steps_path, notice: "Logged in!"
    else
      #flash.now.alert = "Email or password is invalid"
      flash.now[:error] = 'Invalid username/password combination'
      render "new"
    end
  end

  def destroy
    #sign_out
    #redirect_to root_path
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  private

    def is_signed_in_user
      if signed_in?
        redirect_to families_path
      end
    end

end
