class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      
      t.date :day, null: false
      t.string :title, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.boolean :all_day, null:false, default: false
      t.text :memo
      
      t.timestamps
    end
  end
end
