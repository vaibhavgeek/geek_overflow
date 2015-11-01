class HomeController < ApplicationController
     before_filter :application_code
require 'open-uri'
require 'json'

def index
 	  @projects = Search.search(params[:search])
 	  if @projects.count == 0
 	  	if params[:search] != nil && params[:search] != ""
 	  	Search.create(:search_query => params[:search])
 	    end
 	  end
 	  @searches = Search.all

end 
def results
 	
  	my_search_client = Google::APIClient.new
	google_search = my_search_client.discovered_api('customsearch')
	@responsegoogle = my_search_client.execute(
 	 google_search.cse.list, 'q' =>  params[:search_list].to_s
)
  
end
def emergency
	response = Exotel::Call.connect_to_agent(:to => '08039511986', :from => '9512535646', :caller_id => '08039511986', :call_type => 'trans')
end

def hospital
	@name = []
	@location = []
	@status = []
	hospitals_json = RestClient.get 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=21.1700,72.8300&rankby=distance&types=hospital&key=AIzaSyBUK3jJ6Yh8MB3_2imJUBqAI8Dk8L5Zbds', {:accept => :json}
	parsed_json = ActiveSupport::JSON.decode(hospitals_json)
	@datas = parsed_json["results"]
	
	#@data = datas[1]['name']
	#@hospitals_json = RestClient.get 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&rankby=distance&types=hospital&key=AIzaSyBUK3jJ6Yh8MB3_2imJUBqAI8Dk8L5Zbds', {:content_type => :json, :accept => :json}
	#result = JSON.parse(open("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&rankby=distance&types=hospital&key=AIzaSyBUK3jJ6Yh8MB3_2imJUBqAI8Dk8L5Zbds").read)
	#@hospitals_json = JSON.parse(open("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&rankby=distance&types=hospital&key=AIzaSyBUK3jJ6Yh8MB3_2imJUBqAI8Dk8L5Zbds").read)
	#@hospitals_json = JSON('https://voguepay.com/?v_transaction_id=demo-1345109950&type=json').body
end

def stations
	@name = []
	@location = []
	station_json = RestClient.get 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=21.1700,72.8300&rankby=distance&types=bus_station&key=AIzaSyBUK3jJ6Yh8MB3_2imJUBqAI8Dk8L5Zbds', {:accept => :json}
	parsed_json = ActiveSupport::JSON.decode(station_json)
	@datas = parsed_json["results"]
	
	#@geocoder = Geocoder.search(@response["lat"].to_s + " , " + @response["lat"].to_s)
end

def ngo
	response = Exotel::Call.connect_to_agent(:to => '08039511986', :from => '8583035546', :caller_id => '08039511986', :call_type => 'trans')
end

def application_code
 	surat_demo_ip = '123.201.85.234'
 	@response = Net::HTTP.get_response("ip-api.com","/json/123.201.85.234").body
 	@json_response = JSON.parse @response

end
 
end
