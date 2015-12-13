class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :roles_users

  # Role ID for authorization
  USER_ROLE   = {
      super_admin: 1,
      member: 2,
  }
end