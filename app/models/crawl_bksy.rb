class CrawlBksy < ActiveRecord::Base
  require 'net/https'
  require 'uri'
  require 'open-uri'
 
  BKSYURL = 'http://jwbinfosys.zju.edu.cn/jwggcx.aspx?type=1'

  def self.get
          data = URI.parse(URI.encode(BkSYURL)).read
          data.encode! 'utf-8' ,'gb2312'
  
          lastDwjl = CrawlDwjl.last
          20.times do
            url_head = data.index('onclick="window.open(')
            data = data[url_head..-1]
            url_tail = data.index('gxlb')-4
            url = data[22..url_tail]
  
  
            title_head = data.index('border=0/>')
            data = data[title_head..-1]
            title_tail = data.index('</a></td><td>') - 1
            title = data[11..title_tail]
  
            time_head = data.index('span><a href="')
            data = data[url_head..-1]
            url_tail = data.index('" target') -1
            url = data[14..url_tail]
            url = "#{DWJLBASE}#{url}"
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
