class Schedule < ApplicationRecord
  
  belong_to :user
  belong_to :category
  has_many :marks
  has_many :reflections, dependent: :destroy
  
end
