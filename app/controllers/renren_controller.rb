class RenrenController < ApplicationController
    include RenrenApi

    def login
	if !signed_in?
                redirect_to root_url
        else
		redirect_to client.authorize_url(
	 	   :client_id    => ClientID,
		   :redirect_uri => redirect_url,
		   :response_type=> 'code',
		   :scope => 'read_user_feed'
		)	
	end	
    end
    def logout
	current_user_renren.delete
	redirect_to current_user
    end
    def loginnext
	access_token = client.get_token({
		:client_id => Api_key,
		:client_secret => Api_secret,
		:code => params[:code], 
		:redirect_uri => redirect_url,
		:grant_type => "authorization_code"
	})
	print access_token.token
	session[:renren_access_token]=access_token.token
	
	res = JSON URI.parse(URI.encode("https://graph.renren.com/renren_api/session_key?oauth_token=#{session[:renren_access_token]}")).read
	print @res
	@user_renren = current_user.build_user_renren({
		:renren_id    => res["user"]["id"],
		:access_token => access_token.token,
		:session_key  => res["renren_token"]["session_key"]
	})
	if   @user_renren.save
	      flash[:success] = "Micropost created!"
	      redirect_to current_user
	else
	      redirect_to root_url
	end
	
	#res=JSON Net::HTTP.get(geturi)
=begin
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
      
	redirect_to current_user#"/renren/user"#定向到我们的应用页面         
=end
    end
    def info
	session_key = session[:renren_session_key]
    end
    def basic_info
    end
    def profile  
    end
    def feed
    end
    def friend_list
    end
end 
