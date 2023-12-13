class Schedule < ApplicationRecord
  
  belongs_to :user
  belongs_to :category
  has_many :marks
  has_many :reflections, dependent: :destroy
  
  def self.looks(search, word)
    if search == "partial"
      @schedule = Schedule.where("title LIKE?", "%#{word}%")
    else
      @schedule = Schedule.all
    end
  end
end
