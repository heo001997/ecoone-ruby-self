class OauthAccessToken < ApplicationRecord
  belongs_to :user, foreign_key: :user_name, primary_key: :username
end