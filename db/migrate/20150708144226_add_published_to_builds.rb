class AddPublishedToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :published, :boolean, default: true
  end
end
