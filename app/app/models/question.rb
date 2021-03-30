class Question < ApplicationRecord
    has_many :test_questions
    has_many :tests, through: :test_questions
    has_many :answers
end
#should it be question belongs to test
#shouldnt a question have one answer?
