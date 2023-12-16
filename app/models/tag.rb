class Tag < ApplicationRecord
  
  has_many :reflection_tags, dependent: :destroy
  has_many :reflections, through: :reflection_tag
  
end
