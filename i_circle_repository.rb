class ICircleRepository
  # Interfaceとして定義

  def save(circle)
    raise NotImplementedError.new('未定義')
  end

  def find(circle_id)
    raise NotImplementedError.new('未定義')
  end

  def find(circle_name)
    raise NotImplementedError.new('未定義')
  end
end