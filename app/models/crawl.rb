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
	print DWJLURL	
	data = URI.parse(URI.encode(DWJLURL)).read
	print data[0..5]
	print data.class
  end
end
