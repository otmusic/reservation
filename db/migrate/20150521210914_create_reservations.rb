class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.belongs_to :table
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
