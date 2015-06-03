class Permission < ActiveRecord::Base
  # Voltex.
  # Please review the following content.
  has_and_belongs_to_many :roles
end
