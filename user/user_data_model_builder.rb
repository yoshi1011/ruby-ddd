class UserDataModelBuilder < IUserNotification

  def id(id)
    raise ArgumentError.new('UserIdでない') unless id.instance_of?(UserId)
    @id = id
  end

  def name(name)
    raise ArgumentError.new('UserNameでない') unless name.instance_of?(UserName)
    @name = name
  end

  def build
    UserDataModel.new(
      id: @id.value,
      name: @name.value
    )
  end
end