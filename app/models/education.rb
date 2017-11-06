class Education < ApplicationRecord
  belongs_to :user

  validates :school, :level, :edu_start, :presence => true

end
