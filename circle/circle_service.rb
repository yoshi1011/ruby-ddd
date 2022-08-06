class CircleService
  private attr_reader :circle_repository

  def initialize(circle_repository)
    raise ArgumentError.new("引数がICircleRepositoryを継承していない") unless circle_repository.class.ancestors.include?(ICircleRepository)

    @circle_repository = circle_repository
  end

  def exists(circle)
    raise ArgumentError.new('Circleクラスでない') unless other.instance_of?(Circle)

    duplicated = circle_repository.find(circle.name)
    duplicated != nil
  end
end