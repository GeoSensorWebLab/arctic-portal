class MapNote < ActiveRecord::Base
  belongs_to :user, inverse_of: :map_notes
end
