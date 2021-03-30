class Test < ApplicationRecord
    has_many :test_questions
    has_many :questions, through: :test_questions
    has_many :user_tests
    has_many :users, through: :user_tests
    
end
