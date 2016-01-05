class AddItemUrlsToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :mb_url, :string
    add_column :builds, :cpu_url, :string
    add_column :builds, :gpu_url, :string
    add_column :builds, :ram_url, :string
    add_column :builds, :disk_url, :string
    add_column :builds, :chassis_url, :string
  end
end
