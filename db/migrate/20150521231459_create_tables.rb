class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
    	t.belongs_to :restaurant
    	t.integer :number
    	t.string :name
      t.timestamps null: false
    end
  end
end
