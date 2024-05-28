class SessionsController < ApplicationController
    skip_before_action :check_session_timeout, only: [:new, :create]
    def new

    end
    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            user.create_session_token
            user.update(last_seen_at: Time.current)
            session[:session_token] = user.session_token
            Rails.logger.info "----------------------------------------------------------------------------------------------------------"
            Rails.logger.info "user info #{user.inspect}"
            Rails.logger.info "session details #{session.inspect}"
            Rails.logger.info "----------------------------------------------------------------------------------------------------------"
            
            redirect_to root_path,notice: "logged in successfully"
        else
            flash[:alert] = "Not valid"
            render :new ,status: :unprocessable_entity
        end
    end
    def edit
    end
    def destroy
        current_user.update(session_token: nil)
        reset_session        
        redirect_to sign_in_path , notice:'Logged out'
    end

end