require 'model'

describe 'Model' do

  it 'can store a key value pair' do
    model = Model.new
    model.store('color=blue')
    expect(model.data).to eq({'color' => 'blue'})
  end

  it 'can retrieve a value given a key' do
    model = Model.new
    model.store('color=blue')
    expect(model.get('color')).to eq('blue')
  end

end
