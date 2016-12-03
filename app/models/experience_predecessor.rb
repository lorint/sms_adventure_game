class ExperiencePredecessor < ApplicationRecord
  belongs_to :experience
  has_many :experience_predecessor_drivers
  has_many :driving_experiences, through: :experience_predecessor_drivers, source: :driving_experience
end
