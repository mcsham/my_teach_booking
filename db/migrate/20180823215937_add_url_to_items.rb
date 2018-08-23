class AddUrlToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :url, :string, default: 'http://loremflickr.com/300/300'
  end
end
