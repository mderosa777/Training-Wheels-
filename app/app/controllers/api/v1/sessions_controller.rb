class Api::V1::SessionsController < ApplicationController
    def create 
        # byebug
        @user = User.find_by(username: users_params[:username])
       
        if @user && @user.authenticate(users_params[:password])
            
            payload = { user_id: @user.id }
            token = JWT.encode(payload,'phase5')
            
            render json: {auth_key: token, user: @user}, include: [:user_tests]
        else 
            render json: {:msg => "login failed"}, :status => :ok
        end
    end

        private
    def users_params
        params.require(:session).permit(:username, :password)
    end
end
