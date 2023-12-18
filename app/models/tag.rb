class Tag < ApplicationRecord

  has_many :reflection_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :reflections, through: :reflection_tags

end
