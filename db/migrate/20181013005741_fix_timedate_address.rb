class FixTimedateAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :date_timeaddress

    add_column :events, :date_time, :datetime
    add_column :events, :address, :text
  end
end
