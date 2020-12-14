class ChangeStatusChangeToStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :locks, :status_change, :status
  end
end
