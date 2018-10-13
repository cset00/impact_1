class CreateRegUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :reg_users do |t|
      t.string :first_name
      t.string :last_name
      t.varchar :email
      t.varchar :school
      t.string :suburb
      t.boolean :active_sub
      t.integer :contact_num

      t.timestamps
    end
  end
end
