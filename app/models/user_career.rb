class UserCareer < ApplicationRecord
  validates_uniqueness_of :career_id, scope: :user_id
  validates :career_id, :career_start, :presence => true

  belongs_to :user
  belongs_to :career
  has_many :career_skills, inverse_of: :user_career
  has_many :user_jobs

  accepts_nested_attributes_for :career_skills, :allow_destroy => true # ,reject_if: :all_blank

end

