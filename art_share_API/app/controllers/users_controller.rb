
class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:name, :email)
    end

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)
        if user.save
            redirect_to user_url(user)
        else
            render user.error.full_messages, status: 422
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
        
    end

    def update
        user = User.find(params[:id])

        if user.update(user_params)
            redirect_to user_url(user)
        else
            render user.error.full_messages, status: 422
        end
    end

    def destroy
        user = User.find_by(id: params[:id])

        if user && user.destroy
            redirect_to user_url
        else
            render plain: 'user does not exist'
        end
    end

end