class ChangeNamePassDigest < ActiveRecord::Migration[5.2]
  def change
    remove_column :admin_users, :pass_digest

    add_column :admin_users, :password_digest, :string
  end
end
