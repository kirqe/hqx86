class AddOtherHwToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :other_hw, :text
  end
end
