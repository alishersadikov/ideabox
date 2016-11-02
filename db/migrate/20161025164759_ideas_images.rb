class IdeasImages < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas_images do |t|
      t.integer :idea_id
      t.integer :image_id

      t.timestamps
    end
  end
end
