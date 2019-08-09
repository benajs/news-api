class AddImageColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :news, :image, :string
    add_column :news, :duplicate_of, :string
    add_column :feeds, :image, :string
  end
end
