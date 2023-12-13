class Reflection < ApplicationRecord
  
  belongs_to :schedule
  has_many :reflection_tags, dependent: :destroy
  
  has_many_attached :images
  
  
  def self.looks(search, word)
    if search == "partial"
      @reflection = Reflection.where("title LIKE?", "%#{word}%")
    else
      @reflection = Reflection.all
    end
  end
end
