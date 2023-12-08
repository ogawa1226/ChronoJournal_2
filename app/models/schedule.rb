class Schedule < ApplicationRecord
  
  belongs_to :user
  belongs_to :category
  has_many :marks
  has_many :reflections, dependent: :destroy
  
end
