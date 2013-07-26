module RenrenApi
     Base     = "https://api.renren.com/v2/"
     ClientID = '238917'
     Api_key  = 'ef1c4b01abd34dd59e1123c8bf20bc15'
     Api_secret = 'baf04a7ca0b34a9f849c103760c29b4b'
     Redirect_uri =  "http://localhost:3000/renren/loginnext"

     def setRRApiUri(requestType)
            uriparser = URI::Parser.new()
            case requestType
            when "user_login_get"
              uriparser.parse("#{Base}user/login/get")
	    when "user_get"
	      uriparser.parse("#{Base}user/get")	
	    when "profile_get"
	      uriparser.parse("#{Base}profile/get")	
            when "feed_list"
	      uriparser.parse("#{Base}feed/list")
	    when "friend_list"
	      uriparser.parse("#{Base}friend/list")
	    end
     end   
     def setRRApiParam(requestType, userId)
           params = {:access_token => session[:renren_access_token] }    
           case requestType
           when "user_login_get"
             params
	   when "user_get", "profile_get"
	     params[:userId] = userId
	   when "feed_list"
	     params[:feedType] = "ALL"
	     # Details can be found in wiki.dev.renren.com/wiki/V2/model/feedtype
	   when "friend_list"
	     params[:userId] = userId
	   #  params[:pageSize]   = 20
	   #  params[:pageNumber] = 100
           end
	   params
     end
end
