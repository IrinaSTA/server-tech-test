require_relative 'lib/model.rb'
require_relative 'lib/controller.rb'
require_relative 'lib/http_server.rb'

server = Server.new
server.run
