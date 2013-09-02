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
		   :scope => 'read_user_feed publish_feed'
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
