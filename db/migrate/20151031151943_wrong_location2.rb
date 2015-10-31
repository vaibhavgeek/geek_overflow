class WrongLocation2 < ActiveRecord::Migration
  def change
	rename_column :locations,  :lattitude,  :latitude
 	 add_column :locations,  :ip_address,  :float	
  end
end
