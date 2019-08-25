class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :following_id, null: false, default:0
      t.integer :follower_id, null: false, default:0

      t.timestamps
    end
  end
end
