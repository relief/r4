class CrawlDwjl < ActiveRecord::Base
 
  extend RenrenApi
  require 'oauth2'
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
	puts DWJLURL	
	data = URI.parse(URI.encode(DWJLURL)).read
	10.times do
	  head = data.index('target="_blank" title="')
	  data = data[head..-1]
	  tail = data.index('">')

	  #encoding: GB2312
	  puts data[23..tail].force_encoding("UTF-8")
	  puts data[23..tail].force_encoding("GB2312")
	end
  end
end
