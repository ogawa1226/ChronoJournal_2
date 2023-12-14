class DropReflectionImage < ActiveRecord::Migration[6.1]
  def up
    drop_table :reflection_images
  end
end
