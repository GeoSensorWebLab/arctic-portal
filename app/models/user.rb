class User < ActiveRecord::Base
  has_many :authorizations, inverse_of: :user
  has_many :map_notes, inverse_of: :user

  def self.create_from_hash!(hash)
    create(identity: hash['info']['name'], email: hash['info']['email'])
  end
end
