class AddTwitterPostedToBuild < ActiveRecord::Migration
  def change
    add_column :builds, :tweeted, :boolean
  end
end
