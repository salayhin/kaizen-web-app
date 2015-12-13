# encoding: utf-8
class RolesUsers < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  # def self.update_user_role_for_seller(user_id)
  #   user_role = RolesUsers.find_by_user_id(user_id)
  #   user_role.update_attribute(:role_id, Role::USER_ROLE[:seller])
  # end
end
