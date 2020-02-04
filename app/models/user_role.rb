class UserRole < ApplicationRecord
  # How can I know what should I link to where and where else I need to get data
  has_many :user
  has_many :user_role_menu_items
  has_many :menu_item, through: :user_role_menu_items
end