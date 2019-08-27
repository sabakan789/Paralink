class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true, null: false, default:0
      t.text :profile
      t.string :userimage

      t.timestamps
    end
  end
end
