class User < ApplicationRecord
    has_secure_password
    
    has_many :user_tests
    has_many  :tests, through: :user_tests

    validates :username,  {presence: true, uniqueness: true }
   
end
#usertest 
#user has_many usertest has many test through usertest
#test has_many usertest and user through usertest