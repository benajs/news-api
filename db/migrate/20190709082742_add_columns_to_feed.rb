class AddColumnsToFeed < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :site
    add_column :feeds, :isXML
    add_column :feeds, :summary
    add_column :feeds, :content
    add_column :feeds, :author
    add_column :feeds, :category
    add_column :feeds, :published
    add_column :feeds, :others
  end
end
