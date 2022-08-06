class EFUserRepository
  def save(user)
    user_data_model_builder = UserDataModelBuilder.new()
    user.notify(user_data_model_builder)

    user_data_model = user_data_model_builder.build()

    # save処理
  end
end