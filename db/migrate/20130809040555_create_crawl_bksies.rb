class CreateCrawlBksies < ActiveRecord::Migration
  def change
    create_table :crawl_bksies do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
    add_index :crawl_bksies, :created_at
  end
end

