class User < ApplicationRecord
  self.primary_key = "user_id"

  has_one :oauth_access_token, { foreign_key: :user_name, primary_key: :username } # What is the best thing for this, should use belongs_to or has_one, why? because in this sistuation username is not really a primary key or foreign key of anything
  belongs_to :user_role # how can it detect so good like this, find out the reason why and of course to customize the parameters as I like

  has_secure_password

  # Added
  validates :username, :user_id, :password, :presence => true
  #validates_uniqueness_of :email

  # Return if user is admin
  def is_admin?
    # Best string comparing ever :v
    self.user_role.name == "Administrator"
  end
end