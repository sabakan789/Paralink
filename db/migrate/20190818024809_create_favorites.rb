class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true, null: false, default:0
      t.references :micropost, foreign_key: true, null: false, default:0

      t.timestamps
    end
  end
end
