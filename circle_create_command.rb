class CircleCreateCommand
  attr_reader :user_id, :name

  def initialize(user_id, name)
    @user_id = user_id
    @name = name
  end
end