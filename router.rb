class Router

  def call(env)
    return ['200', {'Content-Type' => 'text/html'}, ["Hello world! The time is #{Time.now}"]]
  end
end
