class AddContactDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :contact_details, :string
  end
end
