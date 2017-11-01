class CareerSkill < ApplicationRecord
  #validates_uniqueness_of :skill_id, scope: :user_career_id
  validates :user_career_id, :skill_id, :weight, :presence => true

  belongs_to  :user_career ,optional: true
  belongs_to  :skill ,optional: true


end
