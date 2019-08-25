class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.references :micropost, foreign_key: true, null: false, default:0
      t.string :description, null: false, default: ""
      t.string :image, null: false, default: ""

      t.timestamps
    end
  end
end
