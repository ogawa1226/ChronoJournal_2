class CreateReflectionTags < ActiveRecord::Migration[6.1]
  def change
    create_table :reflection_tags do |t|
      
      t.integer :reflection_id, null: false
      t.integer :tag_id, null: false
      
      t.timestamps
    end
  end
end
