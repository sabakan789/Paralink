class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :uid, :string, null: false, default:0
    add_column :users, :provider, :string, null: false, default:""
  end
end
