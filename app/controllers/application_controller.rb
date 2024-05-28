class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :check_session_timeout
    

    def set_current_user
      if session[:session_token]
        @current_user = User.find_by(session_token: session[:session_token])
        if @current_user
          Current.user = @current_user
          Rails.logger.info "Current selected user data is #{Current.user.inspect}"
        else
          Rails.logger.info "Didn't have current user selected"
          reset_session
        end

      else
        Rails.logger.info "didn't recived the ssession[:session_token]"
      end
         
    end

    def user_logged_in?
        redirect_to sign_in_path, alert: 'Please sign in first' if Current.user.nil?
    end

    def check_session_timeout
        if @current_user
          Rails.logger.info "current user details #{@current_user.inspect}"
            if @current_user.last_seen_at &&  @current_user.last_seen_at < SESSION_TIMEOUT.ago
              reset_session
              redirect_to sign_in_path, alert: "Your session has expired. Please sign in again."
            else
              @current_user.update(last_seen_at: Time.current)
            end
        end
    end
    def current_user
      @current_user
    end

    private
    
    
    
end
