class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.belongs_to :user
      t.string :name
      t.attachment :avatar
      t.timestamps null: false
    end
    add_index :restaurants, :name
  end
end
