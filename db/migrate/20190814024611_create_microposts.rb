class CreateMicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :microposts do |t|
      t.text :content, null: false, default: ""
      t.references :user, foreign_key: true, null: false, default:0

      t.timestamps
    end
  end
end
