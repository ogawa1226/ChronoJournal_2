class Tag < ApplicationRecord

  # has_many :reflection_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :reflection_tags, dependent: :destroy
  has_many :reflections, through: :reflection_tags
    
  def self.get_per_count(current_user, page)
    # 自分のスケージュールのIDをすべて取得
    reflection_ids = Reflection.where(user_id: current_user.id).ids
    # 自分の振り返りに紐づくタグ名を配列として取得
    reflection_tags = ReflectionTag.where(reflection_id: reflection_ids).map{|reflection_tag| reflection_tag.tag.name}
    # タグ配列の重複回数をカウントして、@tagsに[[tagName, count], [tagName, count]]の形式で詰め込む
    Kaminari.paginate_array(
              reflection_tags.group_by(&:itself).map{ |key, value| [key, value.count] }.to_a
              ).page(page)
  end
end
