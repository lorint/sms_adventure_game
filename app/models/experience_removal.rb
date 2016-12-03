class ExperienceRemoval < ApplicationRecord
  belongs_to :experience
  belongs_to :removed_experience
end
