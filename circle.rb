class Circle
  # サークルエンティティ
  attr_reader :id, name, owner, members

  def initialize(id, name, owner, members)
    raise ArgumentError.new('値がありません') if valid?(id, CircleId)
    raise ArgumentError.new('値がありません') if valid?(name, CircleName)
    raise ArgumentError.new('値がありません') if valid?(owner, User)
    raise ArgumentError.new('値がありません') if valid?(members, Array)

    @id = id
    @name = name
    @owner = owner
    @members = members
  end

  private

  # MEMO: このvalid?メソッドの定義がすでにドメイン設計ミスってる気がする...とりあえず書いた
  def valid?(argument, object_type)
    if argument.nil? and not id.instance_of?(object_type)
  end
end