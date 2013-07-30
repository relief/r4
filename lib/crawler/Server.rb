class ServerUpdater
    #attr_accessor :servers
    def print(cont)
	print cont
    end
=begin
    def initialize(servers = nil)
        @servers = servers
    end
	
    def update_all
        servers.find_each { |server| server.update_info }
    end
=end
end
