class SessionsController < ApplicationController
  
  def new

  end

  def create
    @user = User.find_by_email params[:email]
    if @user&.authenticate params[:password]
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed In"
    else
      flash.now[:alert] = "Wrong email or password"
      render :new
    end
  end

  def destroy

  end
end
