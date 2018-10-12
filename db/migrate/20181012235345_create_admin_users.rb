class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      t.string :firstname
      t.string :lastname
      t.boolean :active
      t.string :email
      t.string :pass_digest

      t.timestamps
    end
  end
end
