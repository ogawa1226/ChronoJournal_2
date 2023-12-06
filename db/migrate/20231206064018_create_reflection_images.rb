class CreateReflectionImages < ActiveRecord::Migration[6.1]
  def change
    create_table :reflection_images do |t|
      
      t.integer :reflection_id, null:false
      
      t.timestamps
    end
  end
end
