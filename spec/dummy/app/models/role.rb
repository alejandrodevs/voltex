class Role < ActiveRecord::Base
  # Voltex.
  # Please review the following content.
  has_many :users
  has_and_belongs_to_many :permissions
end
