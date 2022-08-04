class UserName
  attr_reader :value

  def initialize(value)
    raise ArgumentError.new('引数が正しくありません') if value.nil? or not value.instance_of?(String)

    @value = value
  end
end