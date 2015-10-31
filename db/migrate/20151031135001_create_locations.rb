class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.float :lattitude
      t.float :longitude
      t.string :address_complete
      t.string :city
      t.string :village
      t.string :state

      t.timestamps null: false
    end
  end
end
