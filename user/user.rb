require_relative './user_name'

class User
  private attr_reader :id

  def initialize(id, name)
    raise ArgumentError.new('UserNameのインスタンスではない') unless name.instance_of?(UserName)
    @id = id
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
      id: note.id(@id),
      name: note.name(@name)
    }
  end
end