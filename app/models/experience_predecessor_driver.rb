class ExperiencePredecessorDriver < ApplicationRecord
  belongs_to :experience_predecessor
  belongs_to :driving_experience, class_name: "Experience", inverse_of: :driving_experiences
end
