class ActivitySkill < ApplicationRecord
  validates :activity_id, :skill_id, :presence => true
  validates :skill_id, :uniqueness =>  {:scope => :activity_id}

  belongs_to :activity, optional: true
  belongs_to :skill, optional: true

end
