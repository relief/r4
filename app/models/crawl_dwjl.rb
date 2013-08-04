class CrawlDwjl < ActiveRecord::Base
  #require 'json'
  #require 'net/https'
  #require 'uri'
  #require 'open-uri'
  #require 'openssl'

  def self.getPage#(url)
	url = "www.google.com"
#	@res = (URI.parse(URI.encode(url))).read
	print url
  end
end
