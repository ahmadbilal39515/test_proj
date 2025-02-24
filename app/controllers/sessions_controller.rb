class SessionsController < ApplicationController
  def new
  end

  def create
    @user =  User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Signup successful!" }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
   
  def destroy
    reset_session  # Clears all session data
    redirect_to login_path, notice: "Logged out successfully."
  end
end