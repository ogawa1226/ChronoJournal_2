class Reflection < ApplicationRecord

  belongs_to :schedule
  has_many :reflection_tags, dependent: :destroy
  has_many :tags, through: :reflection_tags

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

  def save_tags(tags)
    tag_list = tags.split(/[[:blank:]]+/)
    current_tags = self.tags.pluck(:name)

    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_reflection_tag = Tag.find_or_create_by(name: new)
      self.tags << new_reflection_tag
    end
  end
end
