class AddColumnsToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :author, :string
    add_column :news, :url, :string
    add_column :news, :published, :datetime
  end
end
