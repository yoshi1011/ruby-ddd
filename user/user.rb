class User
  attr_reader :id
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

  def notify(note)
    raise ArgumentError.new("引数がIUserNotificationを継承していない") unless note.class.ancestors.include?(IUserNotification)
    {
      note.id(@id),
      note.name(@name)
    }
  end
end