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
 
  def application_code
 
 	surat_demo_ip = '123.201.85.234'
 	@response = Net::HTTP.get_response("ip-api.com","/json/123.201.85.234").body
 	@json_response = JSON.parse @response
end
 private
    def search_params
      params.require(:search).permit(:search_query)
    end

end
