class AddTwitterPostedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :tweeted, :boolean
  end
end
