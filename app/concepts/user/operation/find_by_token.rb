class User::Operation::FindByToken < BaseOperation
  step :validate_authentication_token_present
  step Model(OauthAccessToken, :find_by, :token_id)
  step :convert_token_to_user
  fail Ecoone::Step::ModelNotFound

  def validate_authentication_token_present(options, params:, **)
    if !params[:token_id].present?
      Rails.logger.info("#{__method__} failed as no token was set in Authorization header")
      Railway.fail!
    end

    Railway.pass!
  end

  def convert_token_to_user(options, model:, **)
    options[:model] = model.user

    Railway.pass!
  end

end