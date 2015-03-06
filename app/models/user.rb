class User < ActiveRecord::Base
  has_many :authorizations, inverse_of: :user
end
