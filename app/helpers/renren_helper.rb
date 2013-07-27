module RenrenHelper
   include RenrenApi
   require 'json'
   require 'net/http'
   require 'uri'
   require 'open-uri'
   require 'openssl'
   OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
   def getRenrenInfo_4Root 
        # 获得名字，图片，id
	@renren_user = query_renren "user_login_get"
	cookies.permanent[:renren_userId] = @renren_user["id"]

        # 获得用户基本数据
	@renren_basic_info = query_renren "user_get"

        # 获得主页信息
        @renren_profile  = query_renren "profile_get" 

        # 获得用户新鲜事
        @renren_feed  = query_renren "feed_list" 
	# 获得用户好友
	@renren_friend_list = query_renren "friend_list"
  end
  def query_renren(queryType)
 	uri = setRRApiUri(queryType)
        params = setRRApiParam(queryType, renren_userId)
 	uri.query = URI.encode_www_form(params)
 	(JSON Net::HTTP.get(uri))["response"]
  end
  def renren_userId
	cookies.permanent[:renren_userId] || ""	
  end	
end
