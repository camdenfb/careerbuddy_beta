class CareerSkill < ApplicationRecord
  validates :user_career_id, :skill_id, :weight, :presence => true
  validates :skill_id, :uniqueness =>  {:scope => :user_career_id}

  belongs_to  :user_career ,optional: true
  belongs_to  :skill ,optional: true


end
