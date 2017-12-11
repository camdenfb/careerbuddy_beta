class CompetencySkill < ApplicationRecord
  validates :skill_id, :presence => true
  validates :skill_id, :uniqueness =>  {:scope => :competency_id}

  belongs_to :skill, optional: true
  belongs_to :competency, optional: true

end
