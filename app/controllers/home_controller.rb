class HomeController < ApplicationController
     before_filter :application_code
    


 def index

 	  @projects = Search.search(params[:search])
 	  if @projects.count == 0
 	  	if params[:search] != nil && params[:search] != ""
 	  	Search.create(:search_query => params[:search])
 	    end
 	  end
 	  @searches = Search.all
 end 

def emergency

	response = Exotel::Call.connect_to_agent(:to => '08039511986', :from => '9512535646', :caller_id => '08039511986', :call_type => 'trans')

end
def stations
	@geocoder = Geocoder.search(@response["lat"].to_s + " , " + @response["lat"].to_s)
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
