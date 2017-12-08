class MapNote < ApplicationRecord
  acts_as_paranoid

  belongs_to :user, inverse_of: :map_notes
end
