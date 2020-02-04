class MenuItem < ApplicationRecord
  has_many :user_role_menu_items
  has_many :user_roles, through: :user_role_menu_items
end