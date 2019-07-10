class AddSourceToNews < ActiveRecord::Migration[6.0]
  def change
    add_column :news, :source, :string
  end
end
