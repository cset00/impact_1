class CreateRsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvps do |t|
      t.references :event, foreign_key: true
      t.references :reg_user, foreign_key: true
      t.boolean :active
      t.boolean :attended

      t.timestamps
    end
  end
end
