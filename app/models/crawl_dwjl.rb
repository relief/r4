
class CrawlDwjl < ActiveRecord::Base
 # extend StrConvert 
  require 'json'
  require 'net/https'
  require 'uri'
  require 'open-uri'
  require 'openssl'
#     OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 
  DWJLURL = 'http://ugrs.zju.edu.cn/redir.php?catalog_id=711320'

  def self.InfofromZJU
	getZJUDwjl
  end
  def self.getZJUDwjl
	#puts DWJLURL	
	data = URI.parse(URI.encode(DWJLURL)).read
	data.encode! 'utf-8' ,'gb2312'
	puts data.encoding
	#top = first
	top = where('title = "bottom"')
	puts top.to_s
	2.times do
	  time_head = data.index('<li><span>[')
	  data = data[time_head..-1]
	  time_tail = data.index(']')-1
	  time = data[11..time_tail]
	  
	  url_head = data.index('span><a href="')
	  data = data[url_head..-1]
	  url_tail = data.index('" target') -1
	  url = data[14..url_tail]
	
	  cont_head = data.index('target="_blank" title="')
	  data = data[cont_head..-1]
	  cont_tail = data.index('">') - 1
	  content = data[23..cont_tail]
	  
	  puts time
	  puts url
	  puts content
	end
  end
end
