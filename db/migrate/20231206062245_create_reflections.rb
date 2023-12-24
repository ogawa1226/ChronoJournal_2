class CreateReflections < ActiveRecord::Migration[6.1]
  def change
    create_table :reflections do |t|
      
      t.integer :schedule_id, null: false
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :content, null: false
      
      t.timestamps
    end
  end
end
