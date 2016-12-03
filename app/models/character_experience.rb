class CharacterExperience < ApplicationRecord
  belongs_to :experience
  belongs_to :character
  belongs_to :instigator
end
