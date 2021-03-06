module RenrenHelper
   include RenrenApi
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
  	
end
