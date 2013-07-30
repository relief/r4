class CreateUserRenrens < ActiveRecord::Migration
  def change
    create_table :user_renrens do |t|
      t.references :user
      t.integer :renren_id
      t.string :renren_name
      t.string :access_token
      t.string :session_key
      t.string :large_img

      t.timestamps
    end
    add_index :user_renrens, :user_id
  end
end
