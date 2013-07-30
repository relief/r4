module RenrenApi
     Base     = "https://api.renren.com/v2/"
     ClientID = '238917'
     Api_key  = 'ef1c4b01abd34dd59e1123c8bf20bc15'
     Api_secret = 'baf04a7ca0b34a9f849c103760c29b4b'
     def redirect_url
	if request.host.include? "heroku"
	   "https://zju.heroku.com/renren/loginnext"
	else
	   "http://localhost:3000/renren/loginnext"
        end
     end
     def client
       OAuth2::Client.new(Api_key,Api_secret,:site => {
         :url=>'https://graph.renren.com',
         :response_type=>'code'},
  	 :access_token_url => 'https://graph.renren.com/oauth/token')
     end
     def get_login_info
	if get_renren_id && get_renren_name && get_renren_large_img
		# Information already exists
	else
 		res = query_renren "user_login_get"
	        set_renren_name(res["name"])
		set_renren_large_img(res["avatar"][3]["url"])
	end
     end
     def query_renren(queryType)
	 uri = URI.encode(setRRApiUri(queryType))
	 params = URI.encode_www_form(setRRApiParam(queryType))
	 request =  "#{uri}?#{params}"
	 print request
	 print "------------------------"
	 resp = (JSON URI.parse(request).read)
	 print resp
	 resp["response"]
     end
     def setRRApiUri(requestType)
            case requestType
            when "user_login_get"
              "#{Base}user/login/get"
	    when "user_get"
	      "#{Base}user/get"
	    when "profile_get"
	      "#{Base}profile/get"
            when "feed_list"
	      "#{Base}feed/list"
	    when "friend_list"
	      "#{Base}friend/list"
	    end
     end   
     def setRRApiParam(requestType)
           params = {:access_token => get_access_token }    
           case requestType
           when "user_login_get"
             params
	   when "user_get", "profile_get"
	     params[:userId] = get_renren_id
	   when "feed_list"
	     params[:feedType] = "ALL"
	     # Details can be found in wiki.dev.renren.com/wiki/V2/model/feedtype
	   when "friend_list"
	     params[:userId] = get_renren_id
	   #  params[:pageSize]   = 20
	   #  params[:pageNumber] = 100
           end
	   params
     end	
     def connect_renren?
           !current_user_renren.nil?
     end
     def get_renren_id
           current_user_renren.renren_id
     end
     def set_renren_name(name)
	   current_user_renren.renren_name = name
	   current_user_renren.save
     end
     def get_renren_name
	   current_user_renren.renren_name
     end
     def set_renren_large_img(img_url)
	   current_user_renren.large_img = img_url
	   current_user_renren.save
     end
     def get_renren_large_img
	   current_user_renren.large_img
     end
     def get_access_token
           current_user_renren.access_token
     end	
     def current_user_renren
	   current_user.user_renren
     end

end
