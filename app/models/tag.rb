class Tag < ApplicationRecord
  
  has_many :reflection_tags, dependent: :destroy
  
end
