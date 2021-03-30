class Api::V1::QuestionsController < ApplicationController
    def index
        questions = Question.all 
        render json: questions,include:[:answers, :test_questions]
      end
    
      def show
        question = Question.find(params[:id])
        render json: question
      end
end
