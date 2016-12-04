class ExperiencePredecessor < ApplicationRecord
  belongs_to :experience
  has_many :experience_predecessor_drivers, dependent: :destroy
  has_many :driving_experiences, through: :experience_predecessor_drivers, source: :driving_experience

  validate :must_have_drivers

  private

  def must_have_drivers
    if self.experience_predecessor_drivers.empty?
      self.errors.add(:experience_predecessor_drivers, "MUST have at least one driving experience to create an experience predecessor.")
    end
  end
end
