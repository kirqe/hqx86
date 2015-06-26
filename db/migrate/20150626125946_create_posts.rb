class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :header_img_url
      t.text :body
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
