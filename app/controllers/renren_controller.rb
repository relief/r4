class RenrenController < ApplicationController
  include RenrenApi
  require 'oauth2'
  require 'json'
  require 'net/http'
  require 'uri'
  require 'open-uri'
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  

    def client
      OAuth2::Client.new(Api_key,Api_secret,:site => {
        :url=>'https://graph.renren.com',
        :response_type=>'code'},
	:access_token_url => 'https://graph.renren.com/oauth/token')
    end
    def login
	redirect_to client.authorize_url(
 	   :client_id    => ClientID,
	   :redirect_uri => redirect_url,
	   :response_type=> 'code',
	   :scope => 'read_user_feed'
	)		
    end
    def loginnext
        @access_token = client.get_token({
	      :client_id => Api_key,
	      :client_secret => Api_secret,
	      :redirect_uri => redirect_url,
	      :code => params[:code],
	      :grant_type => "authorization_code"
	})
#	access_token = client.web_server.get_access_token(params[:code], {:redirect_uri => redirect_uri})
	session[:renren_access_token]=@access_token.token
	cookies.permanent[:renren_access_token]=@access_token.token
        #到了这里已经得到了access_token，我暂时把它存在session里面，方便以后使用         
        geturi=URI.parse(URI.encode("http://graph.renren.com/renren_api/session_key?oauth_token=#{session[:renren_access_token]}"))#获得Session Key,为调用renren api做准备         
         
	res=JSON Net::HTTP.get(geturi)#这里我们就得到了人人 api         
        @session_key = res["renren_token"]["session_key"]
	@expires_in  = res["renren_token"]["expires_in"]
	@refresh_token = res["renren_token"]["refresh_token"]

	session[:renren_session_key]= res["renren_token"]["session_key"]
	cookies.permanent[:renren_session_key] = res["renren_token"]["session_key"]
	session[:renren_expires_in]=res["renren_token"]["expires_in"]
	session[:renren_refresh_token]=res["renren_token"]["refresh_token"]
      
	redirect_to root_url#"/renren/user"#定向到我们的应用页面         
    end
    def info
	session_key = session[:renren_session_key]
    end
    def user         
	session_key=session[:renren_session_key]
	# 获得名字，图片，id
	uri = setRRApiUri("user_login_get")
	params = setRRApiParam("user_login_get", "")
	uri.query = URI.encode_www_form( params)
	@user = (JSON Net::HTTP.get(uri))["response"]
 	@userId =@user["id"]	
	# 获得用户基本数据
	uri = setRRApiUri("user_get")
	params = setRRApiParam("user_get", @userId)
	uri.query = URI.encode_www_form( params )
	@res  = (JSON Net::HTTP.get(uri))["response"]
	# 获得主页信息
	uri = setRRApiUri("profile_get")
	params = setRRApiParam("profile_get", @userId)
	uri.query = URI.encode_www_form( params )
	@profile  = (JSON Net::HTTP.get(uri))["response"]
	# 获得用户新鲜事
	uri = setRRApiUri("feed_list")
	params = setRRApiParam("feed_list", @userId)
	uri.query = URI.encode_www_form( params )
	@feed  = (JSON Net::HTTP.get(uri))["response"]
	# 获得用户所有好友	
	uri = setRRApiUri("friend_list")
	params = setRRApiParam("friend_list", @userId)
	uri.query = URI.encode_www_form( params )
	@friend_list = (JSON Net::HTTP.get(uri))["response"]
    end        
end 
