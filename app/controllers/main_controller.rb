class MainController < ApplicationController
    before_action :user_logged_in?
    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end
end