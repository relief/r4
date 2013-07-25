class RenrenController < ApplicationController
  require 'oauth2'
  require 'json'
  require 'net/http'
  require 'uri'
  require 'open-uri'
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

    def client
      OAuth2::Client.new(api_key,api_secret,:site => {
        :url=>'https://graph.renren.com',
        :response_type=>'code'},
	:access_token_url => 'https://graph.renren.com/oauth/token')
    end
    def login
	redirect_to client.authorize_url(
 	   :client_id    => client_id,
	   :redirect_uri => redirect_uri,
	   :response_type=> 'code'
	)		
    end
    def loginnext
        @access_token = client.get_token({
	      :client_id => api_key,
	      :client_secret => api_secret,
	      :redirect_uri => redirect_uri,
	      :code => params[:code],
	      :grant_type => "authorization_code"
	})
#	access_token = client.web_server.get_access_token(params[:code], {:redirect_uri => redirect_uri})
	session[:renren_access_token]=@access_token.token
        #到了这里已经得到了access_token，我暂时把它存在session里面，方便以后使用         
        geturi=URI.parse(URI.encode("http://graph.renren.com/renren_api/session_key?oauth_token=#{session[:renren_access_token]}"))#获得Session Key,为调用renren api做准备         
         
	res=JSON Net::HTTP.get(geturi)#这里我们就得到了人人 api         
        @session_key = res["renren_token"]["session_key"]
	@expires_in  = res["renren_token"]["expires_in"]
	@refresh_token = res["renren_token"]["refresh_token"]

	session[:renren_session_key]= res["renren_token"]["session_key"]
	session[:renren_expires_in]=res["renren_token"]["expires_in"]
	session[:renren_refresh_token]=res["renren_token"]["refresh_token"]
      
	redirect_to "/renren/user"#定向到我们的应用页面         
    end
    def user         
	session_key=session[:renren_session_key]
 
	str="api_key=#{api_key}"         
         
	str<<"call_id=#{Time.now.to_i}"         
         
	str<<"format=JSON"         
         
	str<<"method=xiaonei.users.getInfo"         
         
	str<<"session_key=#{session_key}"         
         
	str<<"v=1.0"         
         
	str<<"#{api_secret}"#注意这里的str是有顺序的，具体的要求请参考［4］         
         
	sig=Digest::MD5.hexdigest(str)#生成参数sig（这是个什么东东呢，人人的解释是“ 它是由当前请求参数和secretKey的一个MD5值”）         
        
	uri = URI.parse('https://api.renren.com/v2/user/login/get')
	params = { 
		:access_token => session[:renren_access_token]
	}
	uri.query = URI.encode_www_form( params )
	
	@user = Net::HTTP.get(uri)
=begin
 Add params to URI
#uri.query = URI.encode_www_form( params ) 
#	query={:api_key=>api_key,
 #              :call_id=>Time.now.to_i,
  #             :format=>'JSON',
               :method=>'xiaonei.users.getInfo',
              :session_key=>session_key,
               :v=>'1.0',
               :sig=>sig
        }#按照api组织参数         
        query1 = {
		:access_token => session[:renren_access_token]  
	}
        @user=JSON Net::HTTP::Get.new("https://api.renren.com/v2/user/login/get",query1)
	source = "#{ROOT_DIR}/#{project}"
	@user = Net::HTTP.get_response("example.com","/?search=thing&format=json").body
	#.get_response(URI.parse(URI.encode("https://api.renren.com/v2/user/login/get")),query1).body
         
         #请求数据并且转换成json数据         
=end
    end         
    def client_id
	  '238917'
    end
    def api_key
	  'ef1c4b01abd34dd59e1123c8bf20bc15'
    end
    def api_secret
	  'baf04a7ca0b34a9f849c103760c29b4b'
    end
    def redirect_uri 
	 # "http://localhost:3000/renren/loginnext"
	  "https://zju.heroku.com/renren/loginnext"
    end
  #  def access_token
#	session[:renren_access_token]=access_token.token
 #   end
end
