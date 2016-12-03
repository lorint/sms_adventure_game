class Character < ApplicationRecord
  belongs_to :user
  belongs_to :location

  # money
  # fear
  # health
  # age
  # chutzpah
  # desire_to_uk
end
