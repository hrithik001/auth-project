
class FriendsController < ApplicationController
    before_action :check_session_timeout
    before_action :set_friend, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user, only: [:edit, :update, :destroy]

    def index
        @friends = Friend.all
    end

    def show
    end

    def new
        @friend = Friend.new
    end

    def create
        @friend = current_user.friends.build(friend_params)
        if @friend.save
            redirect_to @friend, notice: 'woooh , New friend created'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @friend.update(friend_params)
            redirect_to @friend, notice: 'Friend was updated successfully.'
        else
            render :edit
        end
    end

    def destroy
        first_name = @friend.first_name
        @friend.destroy
        redirect_to friends_url, notice: "#{first_name} was successfully removed."
    end

    private

    def set_friend
        @friend = Friend.find(params[:id])
    end

    def friend_params
        params.require(:friend).permit(:first_name, :last_name, :email, :contact_number)
    end


    def authorize_user
        unless @friend.user == current_user
            redirect_to friends_path, alert: "You are not authorized to perform this action"
        end
    end

    def current_user
        @current_user = Current.user
    end
end


