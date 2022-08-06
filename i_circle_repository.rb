class ICircleRepository
  # Interfaceとして定義

  def save(circle)
    raise NotImplementedError.new('未定義')
  end

  # テキスト通りに書いたが、同じメソッド名が2つできているため修正が必要
  def find(circle_id)
    raise NotImplementedError.new('未定義')
  end

  def find(circle_name)
    raise NotImplementedError.new('未定義')
  end
end