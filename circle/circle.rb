class Circle
  # サークルエンティティ
  attr_reader :id, :name, :owner, :members

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

  def is_full?
    members.count >= 29
  end

  def join(member)
    raise ArgumentError.new('不正な引数値') if member.nil? or not member.instance_of?(User)

    if self.is_full?
      raise StandardError.new('メンバー数の上限を超えています')
    end

    members.append(member)
  end
end