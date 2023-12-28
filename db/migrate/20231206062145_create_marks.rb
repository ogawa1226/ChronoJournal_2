class CreateMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|
      t.integer :user_id, null: false
      t.integer :schedule_id, null: false

      t.timestamps
    end
  end
end