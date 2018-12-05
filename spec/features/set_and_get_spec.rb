require 'spec_helper'

describe 'Server', type: :feature do

  it 'should store and return key value pairs' do
    visit('http://localhost:4000/set?color=blue')
    visit('http://localhost:4000/get?key=color')
    expect(page).to have_content("blue")
  end
end
