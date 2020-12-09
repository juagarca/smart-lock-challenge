class DeleteTimeFromLocks < ActiveRecord::Migration[6.0]
  def change
    remove_column :locks, :time
  end
end
