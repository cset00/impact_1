class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :date_timeaddress
      t.string :subject
      t.text :description
      t.boolean :cancelled
      t.boolean :active

      t.timestamps
    end
  end
end
