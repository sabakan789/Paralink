class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.integer :micropost_id
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
