class AddStatusChangeToRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :status_change, :string
  end
end
