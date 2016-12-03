class Experience < ApplicationRecord
  has_many :character_base_experiences
  has_many :character_experiences

  # This hierarchy exists so that when an experience is negated at a parent level,
  # it disables all child 
  belongs_to :parent, class_name: "Experience", inverse_of: :children, required: false
  has_many :children, class_name: "Experience", foreign_key: :parent_id, inverse_of: :parent

  has_many :experience_predecessors
  has_many :experience_predecessor_drivers, through: :experience_predecessors
  # has_many :predecessors, class_name: "Experience", inverse_of: :successors
  # has_many :experience_successors, class_name: "ExperiencePredecessor", foreign_key: :experience_predecessor_id
  # has_many :successors, class_name: "Experience", inverse_of: :predecessors

  before_save :accept_sentinel_value_for_child_of_root

  def to_s
    "#{self.name} - #{self.character_base_experiences.count} CBEs"
  end

  private

  def accept_sentinel_value_for_child_of_root
    self.parent_id = nil if self.parent_id == -1
  end
end
