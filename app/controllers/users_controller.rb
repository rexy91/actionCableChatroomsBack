class UsersController < ApplicationController
    
    def create
        user = User.create(new_user_params)
        if user.valid?
            render json: user, :except =>  [:password_digest, :created_at, :updated_at]
        else
            render json: {errors: @user.errors.full_messages}
        end
    end



    private
    def new_user_params
        params.permit(:first_name, :last_name, :username, :password)
    end
end
