class AddTimeToRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :time, :datetime
  end
end
