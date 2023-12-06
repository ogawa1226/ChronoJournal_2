class Reflection < ApplicationRecord
  
  belong_to :schedule
  has_many :reflection_tags, dependent: :destroy
  has_many :reflection_images, dependentk: :destroy
  
end
