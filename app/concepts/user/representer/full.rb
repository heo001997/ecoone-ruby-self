require 'roar/decorator'
require 'roar/json'

class User::Representer::Full < User::Representer::Short
  include Roar::JSON

  property :address
  property :dob
  property :gender
  property :main_screen
  property :phone_number

  property :user_role do
    property :user_role_id
    property :name
    property :created_date
    property :created_by
    property :update_date
    property :update_by
    property :active

    collection :menu_itmes do
      property :menu_itme_id
      property :name
      property :icon
      property :url
      property :parent_id
      property :position
    end
  end
end