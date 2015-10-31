class HomeController < ApplicationController
 def index
 	require 'open-uri'
 	surat_demo_ip = '123.201.85.234'
 	@response = Net::HTTP.get_response("ip-api.com","/json/123.201.85.234").body
 	@json_response = JSON.parse @response

 end 
end
