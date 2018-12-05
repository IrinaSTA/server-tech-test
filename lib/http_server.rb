require 'socket'
require 'rack'
require_relative './controller.rb'
# http_server.rb
class Server
  attr_reader :method, :path, :query, :status, :headers, :body

  def initialize(app = Controller.new, port = 4000)
    @app = app
    @port = port
  end

  def request_parts(request)
    @method, full_path = request.split(' ')
    @path, @query = full_path.split('?')
  end

  def response
    @status, @headers, @body = @app.call(
      'REQUEST_METHOD' => @method,
      'PATH_INFO' => @path,
      'QUERY_STRING' => @query
    )
  end

  def run
    @server = TCPServer.new @port
    while (session = @server.accept)
      request = session.gets
      puts request
      request_parts(request)
      response
      session.print "HTTP/1.1 #{@status}\r\n"
      @headers.each do |key, value|
        session.print "#{key}: #{value}\r\n"
      end
      session.print "\r\n"
      @body.each do |part|
        session.print part
      end
      session.close
    end
  end
end
