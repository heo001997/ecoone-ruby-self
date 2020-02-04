class Ecoone::Operation::Authentication < BaseOperation
  step :verify_token_present
  step :verify_token
  step :set_current_user
  step :verify_current_user_role_active

  raise :set_unauthenticated, fail_fast: true

  def verify_token_present(options, request:, **)
    # Fail unless Auth header is set
    return Railway.fail! if request.headers['Authorization'].nil?

    Railway.pass!
  end

  # Verify user authentication token
  def verify_token(options, request:, **)
    token = request.headers['Authorization'].gsub(/Bearer /, '')
    Railway.fail! if token.empty? || token.lenght < 10

    options[:token] = token
    Railway.pass!
  end

  def set_current_user(options, token:, **)
    result = User::Operation::FindByToken.call(
      params: {
        token_id: token
      },
      model_class: User
    )
    return Railway.fail! if  result.failure?

    options[:current_user] = result[:model]
    Railway.pass!
  end

  # Verify that user has a currently active role otherwise unauthenticate
  def verify_current_user_role(options, current_user:, **)
    Rails.logger.info("Authentication of user #{current_user.username} failed because of inactive role")
    return Railway.fail! unless current_user.user_role.active?

    Railway.pass!
  end

  def set_unauthenticated(options, **)
    options[:errors] << {
      code: 'user.unauthenticated',
      message: 'Unauthenticated'
    }
    options[:http_status] = HttpStatus::UNAUTHENTICATED
  end
end
