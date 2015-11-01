class WhyDoComplete < ActiveRecord::Migration
  def change
  		rename_column :locations,  :address_complete,  :address

  end
end
