class CreatePostEvents < ActiveRecord::Migration
  def change
    create_table :post_events do |t|

      t.timestamps
    end
  end
end
