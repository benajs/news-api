class AddColumnsToFeed < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :site, :string
    add_column :feeds, :isXML, :string
    add_column :feeds, :summary, :string
    add_column :feeds, :content, :string
    add_column :feeds, :author, :string
    add_column :feeds, :category, :string
    add_column :feeds, :published, :string
    add_column :feeds, :others, :string
  end
end
