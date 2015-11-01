class CreateHelpfeeds < ActiveRecord::Migration
  def change
    create_table :helpfeeds do |t|
      t.integer :user_mobile
      t.string :feed
      t.string :user_name
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
