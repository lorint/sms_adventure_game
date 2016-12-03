class CharacterBaseLocation < ApplicationRecord
  belongs_to :character
  belongs_to :location
end
