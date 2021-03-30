class Api::V1::UserTestsController < ApplicationController
    def index
        user_tests = UserTest.all 
        render json: user_tests
      end
    
      def show
        user_test = UserTest.find(params[:id])
        render json: user_test
      end

      def create
        user_test = UserTest.create(test_id: params[:test_id], user_id: params[:user_id], result: params[:result])
        # render json: {auth_key: token, user: @user}, include: [:user_tests]
      end
end
# You don’t need to use any params. Create the user and if the user gets validated and saved use the user.id and Test.first.id to create the UserTest. The result can just be 0.
