class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to links_path
    else
      flash.now[:danger] = "There was a problem with your credentials."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "You have been signed off."
    redirect_to login_path
  end
end
