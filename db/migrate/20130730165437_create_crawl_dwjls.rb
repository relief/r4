class CreateCrawlDwjls < ActiveRecord::Migration
  def change
    create_table :crawl_dwjls do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
    add_index :crawl_dwjls, :created_at
  end
end
