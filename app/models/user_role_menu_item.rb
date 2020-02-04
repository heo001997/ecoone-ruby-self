class UserRoleMenuItem < ApplicationRecord
  belongs_to :user_role
  belongs_to :menu_item
end