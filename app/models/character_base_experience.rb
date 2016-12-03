class CharacterBaseExperience < ApplicationRecord
  belongs_to :character_base
  belongs_to :experience
  belongs_to :location
end
