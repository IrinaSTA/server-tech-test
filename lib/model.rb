# model.rb
class Model
  attr_reader :data

  def initialize
    @data = {}
  end

  def store(query)
    parse(query).each { |key, value| @data[key] = value }
  end

  def get(key)
    @data[key]
  end

  def key(query)
    parse(query)['key']
  end

  private

  def parse(pair)
    key, value = pair.split('=')
    { key => value }
  end
end
