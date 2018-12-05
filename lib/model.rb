class Model

  attr_reader :data

  def initialize
    @data = {}
  end

  def store(pair)
    parse(pair).each { |key, value| @data[key] = value }
  end

  def get(key)
    @data[key]
  end

  private

  def parse(pair)
    key, value = pair.split('=')
    return {key => value}
  end

end
