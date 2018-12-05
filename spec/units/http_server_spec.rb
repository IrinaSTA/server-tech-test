require_relative '../../lib/http_server'
require 'webmock/rspec'

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
    @server.response
    expect(@server.status).to eq('200')
    expect(@server.headers).to eq('Content-Type' => 'text/html')
    expect(@server.body).to eq(['Hello world!'])
  end

  it 'can spool up on given port' do
    stub_request(:get, 'http://http//localhost:4000:80/set?color=blue')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: '', headers: {})
    expect(Net::HTTP.get('http://localhost:4000', '/set?color=blue')).to eq('')
  end

  it 'can spool up on given port' do
    stub_request(:get, 'http://http//localhost:4000:80/get?key=color')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: 'blue', headers: {})
    expect(Net::HTTP.get('http://localhost:4000', '/get?key=color'))
      .to eq('blue')
  end
end
