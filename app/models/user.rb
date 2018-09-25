class User < ApplicationRecord
  validates :email, :role, presence: true
end
