class User < ActiveRecord::Base
  has_many :authorizations, inverse_of: :user

  def self.create_from_hash!(hash)
    create(identity: hash['info']['name'])
  end
end
