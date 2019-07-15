class AddColumnsToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :story
    add_column :feeds, :reference
  end
end
