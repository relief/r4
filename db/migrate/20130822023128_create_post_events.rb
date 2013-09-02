class CreatePostEvents < ActiveRecord::Migration
  def change
    create_table    :post_events do |t|
      t.string      :title
      t.datetime    :time
      t.string      :campus
      t.string      :building
      t.string      :detail_place
      t.string	    :description
      t.timestamps
    end
  end
end
