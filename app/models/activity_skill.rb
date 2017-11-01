class ActivitySkill < ApplicationRecord

  belongs_to :activity, optional: true
  belongs_to :skill, optional: true

end
