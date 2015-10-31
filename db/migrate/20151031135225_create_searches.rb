class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :location_id
      t.string :search_query

      t.timestamps null: false
    end
  end
end
