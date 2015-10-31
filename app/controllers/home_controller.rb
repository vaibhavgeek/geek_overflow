class HomeController < ApplicationController
 def index
   require 'geoip'
   @info = GeoIP.new(Rails.root.join("GeoLiteCity.dat")).city(ip_request_params[:host])

 end 
end
