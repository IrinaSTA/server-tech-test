require_relative '../../router'

describe Router do

  let(:router) { Router.new }

  it "can return 'Hello world!'" do
    status, headers, body = router.call({
      'REQUEST_METHOD' => 'GET',
      'PATH_INFO' => '/',
      'QUERY_STRING' => ''
      })
    expect(status).to eq('200')
    expect(headers).to eq({"Content-Type"=>"text/html"})
    expect(body[0]).to include('Hello world!')
  end

  it "returns the right response to 'set' request" do
    status, headers, body = router.call({
      'REQUEST_METHOD' => 'GET',
      'PATH_INFO' => '/set',
      'QUERY_STRING' => 'color=blue'
      })
    expect(status).to eq('200')
    expect(headers).to eq({"Content-Type"=>"text/html"})
    expect(body).to eq([])
  end
end
