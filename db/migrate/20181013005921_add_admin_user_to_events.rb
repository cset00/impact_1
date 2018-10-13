class AddAdminUserToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :admin_user, foreign_key: true
  end
end
