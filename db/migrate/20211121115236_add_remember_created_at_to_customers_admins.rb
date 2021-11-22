class AddRememberCreatedAtToCustomersAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :remember_created_at, :datetime
    add_column :admins, :remember_created_at, :datetime
  end
end
