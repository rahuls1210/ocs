class ShingleController < ApplicationController
    require 'net/http'
    require 'json'
    API_BASE_URL = "https://mdms.owenscorning.com/api/v1/product/shingles?zip=43659" 
    def index
        url = "#{API_BASE_URL}" # specifying json format in the URl
        
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host,uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE        
        request = Net::HTTP::Get.new(uri.request_uri)
        
        response = http.request(request)
        #@users = response.body
       
        s = JSON.parse(response.body, :symbolize_names => true)
        @all_shingles = s
        if(params.has_key?(:shingle))
            @shingle = s.find{|h1| h1[:uid] == params[:shingle]}
            respond_to do |format|
                format.html # index.html.erb
                format.js {render layout: false }
               end
        #abort @shingle.inspect
        else
            @shingle = s.find{|h1| h1[:uid] == 'trudefinition-duration'}
           # abort @users.inspect
        end

       
      end
    

end