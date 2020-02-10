module User::Contract
  class Create < Reform::Form
    property :username
    property :password
    property :password_confirmation
  end
end