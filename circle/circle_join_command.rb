class CircleJoinCommand
  attr_reader :user_id, :circle_id

  def initialize(user_id, circle_id)
    raise ArgumentError.new('user_idの型がStringではない') unless user_id.instance_of?(String)
    raise ArgumentError.new('circle_idの型がStringではない') unless circle_id.instance_of?(String)

    @user_id = user_id
    @circle_id = circle_id
  end
end