class AddSlugToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :slug, :string
    add_index :builds, :slug, unique: true
  end
end
