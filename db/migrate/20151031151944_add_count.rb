class AddCount < ActiveRecord::Migration
  def change
  add_column :searches, :search_count , :integer
  end
end
