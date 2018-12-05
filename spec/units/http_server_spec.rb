describe 'Server' do
  it 'can parse a set request into method, path and query' do
    request = 'GET /set?color=blue HTTP/1.1'
    method, full_path = request.split(' ')
    path, query = full_path.split('?')
    expect(method).to eq('GET')
    expect(path).to eq('/set')
    expect(query).to eq('color=blue')
  end
end
