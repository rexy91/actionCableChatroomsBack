class UsersController < ApplicationController
    before_action :authorized, only: [:persist]
    
    def index
        users = User.all
        render json: users
    end
    
    def create
        @user = User.create(new_user_params)
        if @user.valid?
            # give a token if valid 
            wristband = encode_token({user_id: @user.id})
            
            render json: {user:@user, token:wristband}, :except =>  [:password_digest, :created_at, :updated_at]
        else
            render json: {errors: @user.errors.full_messages}
        end
    end

    def login
            
            @user= User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
              wristband = encode_token({user_id: @user.id})
              render json: {user: @user, token: wristband}
            else
              render json: {error: "Invalid username or password"}
            end
    end

    def persist
        wristband = encode_token({user_id: @user.id})
        render json: {user: @user , token: wristband}
    end

    private
    def new_user_params
        params.permit(:first_name, :last_name, :username, :password)
    end
end
