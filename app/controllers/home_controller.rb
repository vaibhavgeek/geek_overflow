class HomeController < ApplicationController
 def index
   require 'geoip'
   @info = GeoIP.new(Rails.root.join("GeoLiteCity.dat")).city('117.249.81.241')
   @city = @info.city_name
 end 
end
