class HelpfeedController < ApplicationController
       before_filter :application_code

  def index
    @helpfeeds = Helpfeed.all
  end

  def new
    @helpfeed = Helpfeed.new
  end
 
 
  def create
    @helpfeed = Helpfeed.new(helpfeed_params)
 
    if @helpfeed.save
      redirect_to helpfeed_index_path
    else
      render 'new'
    end
  end
 def application_code
 
 	surat_demo_ip = '123.201.85.234'
 	@response = Net::HTTP.get_response("ip-api.com","/json/123.201.85.234").body
 	@json_response = JSON.parse @response
end
  private
    def helpfeed_params
      params.require(:helpfeed).permit(:user_mobile, :user_name, :feed)
    end

end
