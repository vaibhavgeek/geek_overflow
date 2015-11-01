class MobileNumber < ActiveRecord::Migration
  def change
  	change_column :helpfeeds, :user_mobile,  :string
  end
end
