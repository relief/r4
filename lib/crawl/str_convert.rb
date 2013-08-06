module StrConvert
	require 'iconv'
	class String
   	  def to_gb
	     Iconv.conv("gb2312//IGNORE","UTF-8//IGNORE",self)
	  end
          def utf8_to_gb
             Iconv.conv("gb2312//IGNORE","UTF-8//IGNORE",self)
          end
          def gb_to_utf8
             Iconv.conv("UTF-8//IGNORE","GB18030//IGNORE",self)
          end
          def to_utf8
             Iconv.conv("UTF-8//IGNORE","GB18030//IGNORE",self)
          end
	end
end
