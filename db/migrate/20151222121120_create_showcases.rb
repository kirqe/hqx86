class CreateShowcases < ActiveRecord::Migration
  def change
    create_table :showcases do |t|
      t.string :name
      t.string :header_img_url
      t.string :album_url
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.string :slug

      t.timestamps null: false
    end
    add_index :showcases, :slug, unique: true
  end
end
