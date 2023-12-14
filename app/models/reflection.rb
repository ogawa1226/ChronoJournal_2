class Reflection < ApplicationRecord

  belongs_to :schedule
  has_many :reflection_tags, dependent: :destroy

  has_many_attached :images

  validates :images, limit: { min: 0, max: 5 },
                      content_type: [:png, :jpg, :jpeg]

  # mapメソッドを使って各イメージに対してリサイズした新しい画像を返す
  def get_images
    images.map do |image|
      image.variant(resize_to_limit: [100, 100]).processed
    end
  end


  def self.looks(word)
    @reflection = Reflection.where("title LIKE?", "%#{word}%")
  end
end
