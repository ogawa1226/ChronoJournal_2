class ReflectionImage < ApplicationRecord
  
  belong_to :reflection
  
  has_one_attached :image
  
end

