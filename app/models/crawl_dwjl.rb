class CrawlDwjl < ActiveRecord::Base
 # extend StrConvert 
  require 'json'
  require 'net/https'
  require 'uri'
  require 'open-uri'
  require 'openssl'
#     OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 
  DWJLURL = 'http://ugrs.zju.edu.cn/redir.php?catalog_id=711320'
  DWJLBASE = 'http://ugrs.zju.edu.cn/'

#  attr_accessible :url, :title
  def self.InfofromZJU
	getZJUDwjl
  end
  def self.getZJUDwjl
	#puts DWJLURL	
	data = URI.parse(URI.encode(DWJLURL)).read
	data.encode! 'utf-8' ,'gb2312'

 	lastDwjl = CrawlDwjl.last
	#puts lastDwjl.title
	#new(:title => "lll")
	#tmp.save
	#top = first
	#top = where(title: "bottom")
	#puts top.to_yaml
	13.times do
	  time_head = data.index('<li><span>[')
	  data = data[time_head..-1]
	  time_tail = data.index(']')-1
	  time = data[11..time_tail]
	  
	  url_head = data.index('span><a href="')
	  data = data[url_head..-1]
	  url_tail = data.index('" target') -1
	  url = data[14..url_tail]
	  url = "#{DWJLBASE}#{url}"
	
	  title_head = data.index('target="_blank" title="')
	  data = data[title_head..-1]
	  title_tail = data.index('">') - 1
	  title = data[23..title_tail]
	  
	  if lastDwjl.title == title 
		break
	  else
	     newDwjl = CrawlDwjl.new({
		:url   => url,
		:title => title
	     })
	     newDwjl.save
	     puts time
	     puts url
 	     puts title
	 end
	end
  end
end
