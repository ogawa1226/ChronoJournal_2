class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :schedules, dependent: :destroy
  has_many :reflections, dependent: :destroy
  has_many :marks, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      end_user.name = 'Guest User'
    end
  end

end
