class UserCareer < ApplicationRecord
  validates :career_id, :career_start, :presence => true
  validates :career_id, :uniqueness =>  {:scope => :user_id}

  belongs_to :user
  belongs_to :career
  has_many :user_jobs

  #accepts_nested_attributes_for :career_skills, :allow_destroy => true # ,reject_if: :all_blank

end

