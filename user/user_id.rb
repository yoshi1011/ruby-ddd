class UserId
  attr_reader :value

  def initialize(value)
    raise ArgumentError.new('valueが空です') if value.nil?
    raise ArgumentError.new('型がStringではない') unless value.instance_of?(String)

    @value = value
  end
end