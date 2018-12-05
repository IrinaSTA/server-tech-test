require 'http_server'

describe 'Server' do
  it 'can parse an http request' do
    @app = proc do
      ['200', { 'Content-Type' => 'text/html' },
       ['Hello world!']]
    end
    @server = Server.new(@app, 4000)
    request = 'GET /set?color=blue HTTP/1.1'
    @server.request_parts(request)
    expect(@server.method).to eq('GET')
    expect(@server.path).to eq('/set')
    expect(@server.query).to eq('color=blue')
  end

  it 'can get a response when given a request' do
    @app = proc do
      ['200', { 'Content-Type' => 'text/html' },
       ['Hello world!']]
    end
    @server = Server.new(@app, 4000)
    @server.get_response
    expect(@server.status).to eq('200')
    expect(@server.headers).to eq('Content-Type' => 'text/html')
    expect(@server.body).to eq(['Hello world!'])
  end

  # it 'can spool up on given port' do
  #   @app = proc do
  #     ['200', { 'Content-Type' => 'text/html' },
  #      ['Hello world!']]
  #    end
  #   @server = Server.new(@app, 4000)
  #   @server.boot
  #   stub_request(:get, 'http://localhost:4000')
  #   expect(Net::HTTP.get('http://localhost:4000', "/set?color=blue")).to eq('Success')
  # end
end
