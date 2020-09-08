class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to saved_url || root_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please.'
      render :new
    end
  end

  def destroy
    session.clear
    cookies[:_test_guru_email] = nil
    flash.now[:notice] = 'You are now logged out. Come back asap ^_^.'
    render :new
  end
end
