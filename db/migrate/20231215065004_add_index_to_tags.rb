class AddIndexToTags < ActiveRecord::Migration[6.1]
  def change
    add_index :tags, :name, unique: true
    add_index :reflection_tags, [:reflection_id, :tag_id], unique: true
  end
end
