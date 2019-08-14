class AddColumnsToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :story, :string
    add_column :feeds, :reference, :string
  end
end
