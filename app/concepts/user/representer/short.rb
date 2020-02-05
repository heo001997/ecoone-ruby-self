require 'roar/decorator'
require 'roar/json'

class User::Representer::Short < Roar::Decorator
  include Roar::JSON

  property :user_id
  property :username
  property :first_name
  property :last_name
  property :full_name
  property :email
  property :avatar
  property :description
  property :status
  property :created_date
  property :created_by
  property :updated_date
  property :updated_by

  property :user_role do
    property :user_role_id
    property :name
  end
end