require_relative '../../lib/controller'

describe Controller do
  let(:model_class) { double('Model') }
  let(:model_instance) { instance_double('Model') }
  let(:controller) { Controller.new(model_class) }

  it "can return 'Hello world!'" do
    allow(model_class).to receive(:new).and_return(model_instance)
    allow(model_instance).to receive(:store)
    status, headers, body = controller.call(
      'REQUEST_METHOD' => 'GET',
      'PATH_INFO' => '/',
      'QUERY_STRING' => ''
    )
    expect(status).to eq('200')
    expect(headers).to eq('Content-Type' => 'text/html')
    expect(body[0]).to include('Hello world!')
  end

  it "returns the right response to 'set' request" do
    allow(model_class).to receive(:new).and_return(model_instance)
    allow(model_instance).to receive(:store)
    status, headers, body = controller.call(
      'REQUEST_METHOD' => 'GET',
      'PATH_INFO' => '/set',
      'QUERY_STRING' => 'color=blue'
    )
    expect(status).to eq('200')
    expect(headers).to eq('Content-Type' => 'text/html')
    expect(body).to eq([])
  end

  it "returns the right response to 'get' request" do
    allow(model_class).to receive(:new).and_return(model_instance)
    allow(model_instance).to receive(:store)
    allow(model_instance).to receive(:key)
    allow(model_instance).to receive(:get).and_return('blue')
    controller.call(
      'REQUEST_METHOD' => 'GET',
      'PATH_INFO' => '/set',
      'QUERY_STRING' => 'color=blue'
    )
    status, headers, body = controller.call(
      'REQUEST_METHOD' => 'GET',
      'PATH_INFO' => '/get',
      'QUERY_STRING' => 'key=color'
    )
    expect(status).to eq('200')
    expect(headers).to eq('Content-Type' => 'text/html')
    expect(body).to eq(['blue'])
  end
end
