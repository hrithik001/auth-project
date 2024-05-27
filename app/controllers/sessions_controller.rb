class SessionsController < ApplicationController
    skip_before_action :check_session_timeout, only: [:new, :create]
    def new

    end
    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            session[:last_seen_at] = Time.current
            redirect_to root_path,notice: "logged in successfully"
        else
            flash[:alert] = "Not valid"
            render :new
        end
    end
    def edit
    end
    def destroy
        session[:user_id] = nil
        reset_session
        redirect_to root_path , notice:'Logged out'
    end

end