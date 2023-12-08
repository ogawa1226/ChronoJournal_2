class ReflectionImage < ApplicationRecord
  
  belongs_to :reflection
  
  has_one_attached :image
  
end

