require 'model'

class Router

  def initialize
    @model = Model.new
  end

  def call(env)
    if env['PATH_INFO'].include? 'set'
      @model.store(env['QUERY_STRING'])
      return ['200', {'Content-Type' => 'text/html'}, []]
    elsif env['PATH_INFO'].include? 'get'
      value = @model.get(@model.key(env['QUERY_STRING']))
      return ['200', {'Content-Type' => 'text/html'}, ["#{value}"]]
    else
      return ['200', {'Content-Type' => 'text/html'}, ['Hello world!']]
    end
  end
end
