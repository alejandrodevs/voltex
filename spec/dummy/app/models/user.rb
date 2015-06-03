class User < ActiveRecord::Base
  # Voltex.
  # Please review the following content.
  belongs_to :role
  has_many :permissions, through: :role
end
