class User
  attr_reader :name

  def initialize(name)
    raise ArgumentError.new('UserNameのインスタンスではない') unless name.instance_of?(UserName)
    @name = name
  end

  def change_name(name)
    raise ArgumentError.new('nameがnil') if name.nil?
    raise ArgumentError.new('UserNameのインスタンスではない') unless name.instance_of?(UserName)

    @name = name
  end
end