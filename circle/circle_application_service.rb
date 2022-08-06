require 'pstore'

class CircleApplicationService
  attr_reader :circle_factory, :circle_repository, :circle_service, :user_repository

  def initialize(circle_factory, circle_repository, circle_service, user_repository)
    @circle_factory = circle_factory
    @circle_repository = circle_repository
    @circle_service = circle_service
    @user_repository = user_repository
  end

  def create(command)
    raise ArgumentError.new('commandの型がCircleCreateCommandではない') unless command.instance_of?(CircleCreateCommand)

    db = PStore.new("/")
    db.transaction do
      owner_id = UserId.new(command.user_id)
      owner = @user_repository.find(owner_id)

      if owner.nil?
        raise StandardError.new('サークルのオーナーとなるユーザーが見つかりませんでした')
      end

      name = CircleName(command.name)
      circle = @circle_factory.create(name, owner)

      if @circle_service.exists(circle)
        raise StandardError('サークルは既に存在しています')
      end

      @circle_repository.save(circle)
    end
  end

  def join(command)
    raise ArgumentError.new('commandの型がCircleJoinCommandではない') unless command.instance_of?(CircleJoinCommand)

    db = PStore.new("/")
    db.transaction do
      member_id = UserId.new(command.user_id)
      member = @user_repository.find(member_id)

      if member.nil?
        raise StandardError.new('ユーザーが見つかりませんでした')
      end

      id = CircleId(command.circle_id)
      circle = @circle_repository.find(id)

      if circle.nil?
        raise StandardError.new('サークルが見つかりませんでした')
      end

      circle.join(member)
      @circle_repository.save(circle)
    end
  end
end