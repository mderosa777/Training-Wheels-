class Api::V1::UsersController < ApplicationController
   # skip_before_action :authenticated, only: [:new, :create]
    
    def index 
        users = User.all 
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: {token: token, user: @user}, include: [:user_tests]
      end
    
     
    
    def create
        @user = User.new(username: params[:username], password: params[:password])

        if @user.valid?
            @user.save

             payload = { user_id: @user.id }
             token = JWT.encode(payload,'phase5')
            
             #render json: { auth_key: token }, :status => :ok, include:[:user_tests]
            render json: {auth_key: token, user: @user}, include: [:user_tests]
        else
            render json:{:msg => "not a valid user.."}
    end
end

    private
    def users_params
        params.require(:user).permit(:username, :password)
    end


end
