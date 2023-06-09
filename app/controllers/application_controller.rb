class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  include SessionsHelper
    
  before_action :login_required

  private

    def login_required
      redirect_to new_session_path, alert: "Please log in." unless current_user
    end
    def admin_required
      redirect_to tasks_path, alert: "Only adminsitrators have access." unless current_user.admin
    end

    def already_logged_in
      redirect_to tasks_path, alert: "Please log in." if current_user
    end

    def current_user_required(user)
      redirect_to tasks_path, alert: "You have no access rights." unless current_user ==  user
    end
end

