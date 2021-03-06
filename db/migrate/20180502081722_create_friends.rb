class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :status, default: "wait"

      t.timestamps
    end
  end
end
