class Router

  def call(env)
    if env['PATH_INFO'].include? 'set'
      return ['200', {'Content-Type' => 'text/html'}, []]
    else
      return ['200', {'Content-Type' => 'text/html'}, ['Hello world!']]
    end
  end
end
