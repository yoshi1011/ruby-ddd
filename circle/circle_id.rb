class CircleId
  def def initialize(value)
    raise ArgumentError.new('Stringではありません') unless value.instance_of?(string)
    raise ArgumentError.new('値がありません') if value.nil?

    @value = value
  end
end