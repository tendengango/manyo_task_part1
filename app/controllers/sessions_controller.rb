class SessionsController < ApplicationController
  before_action :already_logged_in, except: :destroy
  skip_before_action :login_required, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      #session[:user_id]= user.id
      log_in(user)
      redirect_to tasks_path
      #redirect_to user_path(user.id)
    else
      flash.now[:alert] = 'Incorrect email address or password.'
      #flash.now[:danger] = 'I failed to login'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    #flash[:notice] = 'logged out'
    redirect_to new_session_path, notice: 'You have logged out.'
    #redirect_to new_session_path
  end
end
