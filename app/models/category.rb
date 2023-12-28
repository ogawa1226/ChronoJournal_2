class Category < ApplicationRecord
  
  has_many :schedules, dependent: :destroy
  
end
