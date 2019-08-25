class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true, null: false, default:0
      t.text :introduction, null: false, default: ""
      t.string :user_image, null: false, default: ""

      t.timestamps
    end
  end
end
