class Schedule < ApplicationRecord
  
  validates :title, presence: true
  
  belongs_to :user
  belongs_to :category
  has_many :marks
  has_many :reflections, dependent: :destroy
  
  
  def self.looks(word)
    @schedule = Schedule.where("title LIKE?", "%#{word}%")
  end
  
end
