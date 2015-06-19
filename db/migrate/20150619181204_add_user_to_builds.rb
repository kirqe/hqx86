class AddUserToBuilds < ActiveRecord::Migration
  def change
    add_reference :builds, :user, index: true, foreign_key: true
  end
end
