class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :check_session_timeout
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def user_logged_in?
        redirect_to sign_in_path, alert: 'Please sign in first' if Current.user.nil?
    end

    def check_session_timeout
        if session[:last_seen_at] && session[:last_seen_at] < SESSION_TIMEOUT.ago
          reset_session
          redirect_to sign_in_path, alert: "Your session has expired. Please sign in again."
        else
          session[:last_seen_at] = Time.current
        end
    end
end
