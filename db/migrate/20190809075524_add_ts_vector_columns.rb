class AddTsVectorColumns < ActiveRecord::Migration[6.0]
  def up
    add_column :news, :tsv, :tsvector
    add_index :news, :tsv, using: "gin"

    execute <<-SQL
      CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
      ON news FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(
        tsv, 'pg_catalog.english', title
      );
    SQL

    now = Time.current.to_s(:db)
    update("UPDATE news SET updated_at = '#{now}'")
  end

  def down
    execute <<-SQL
      DROP TRIGGER tsvectorupdate
      ON news
    SQL

    remove_index :news, :tsv
    remove_column :news, :tsv
  end
end
