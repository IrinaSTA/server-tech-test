require_relative './model'
# router.rb
class Router
  def initialize(model = Model)
    @model = model.new
  end

  def call(env)
    if env['PATH_INFO'].include? 'set'
      @model.store(env['QUERY_STRING'])
      ['200', { 'Content-Type' => 'text/html' }, []]
    elsif env['PATH_INFO'].include? 'get'
      value = @model.get(@model.key(env['QUERY_STRING']))
      ['200', { 'Content-Type' => 'text/html' }, [value.to_s]]
    else
      ['200', { 'Content-Type' => 'text/html' }, ['Hello world!']]
    end
  end
end