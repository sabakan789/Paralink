class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false, default:0
      t.references :micropost, foreign_key: true, null: false, default:0
      t.string :comment, null: false, default: ""

      t.timestamps
    end
  end
end
