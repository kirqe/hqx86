class AddCurrentBuildToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_build, :string
  end
end
