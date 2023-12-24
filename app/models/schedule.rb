class Schedule < ApplicationRecord
  
  belongs_to :user
  belongs_to :category
  has_many :marks
  has_many :reflections, dependent: :destroy
  
  validates :title, presence: true
  validates :category, presence: true
  
  def self.looks(word)
    @schedule = Schedule.where("title LIKE?", "%#{word}%")
  end
end
