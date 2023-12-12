class Reflection < ApplicationRecord
  
  belongs_to :schedule
  has_many :reflection_tags, dependent: :destroy
  
  has_many_attached :images
  
end
