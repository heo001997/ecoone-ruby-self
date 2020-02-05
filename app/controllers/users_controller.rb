class UsersController < ApplicationController
  def index
    result = User::Operation::List.({
        params: params,
        model_class: User,
        id_addtribute: :user_id,
        request: request
    })
    super(result, User::Representer::Short)
  end

  def show
    result = User::Operation::Show.({
        params: params,
        model_class: User,
        id_attribute: :user_id,
        request: request
    })
    super(result, User::Representer::Full)
  end

  def create
    result = User::Operation::Create.({
        params: params,
        model_class: User,
        id_attribute: :user_id,
        request: request
    })
    super(result, User::Representer::Short)
  end
end