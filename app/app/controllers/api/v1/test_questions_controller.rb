class Api::V1::TestQuestionsController < ApplicationController
    def index
        test_questions = TestQuestion.all 
        render json: test_questions
      end
    
      def show
    test_question = TestQuestion.find(params[:id])
        render json: test_question
      end
end
