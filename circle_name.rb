class CircleName
  attr_reader :value

  def initialize(value)
    raise ArgumentError.new('値がありません') if value.nil?
    raise ArgumentError.new('3文字以上で入力せよ') if value.length < 3
    raise ArgumentError.new('20文字以下で入力せよ') if value.length > 20

    @value = value
  end

  def ==(other)
    raise ArgumentError.new("引数が#{self.class}クラスではない") unless other.instance_of?(self.class)
    raise ArgumentError.new('値がありません') if other.value.nil?

    @value == other.value
  end

  def equal?(other)
    self.==(other)
  end
end