class MainController < ApplicationController
    def index
        flash[:notice] = "Successfully installed"
        flash[:alert] = "Alerting the value"
    end
end