class AddUserInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_info, :text
  end
end
