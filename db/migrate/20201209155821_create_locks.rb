class CreateLocks < ActiveRecord::Migration[6.0]
  def change
    create_table :locks do |t|
      t.timestamp :time
      t.string :kind
      t.string :status_change

      t.timestamps
    end
  end
end
