class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :username
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.timestamps
    end
    add_index :admin_users, :username
  end
end
