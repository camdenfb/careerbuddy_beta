class ActivityCompetency < ApplicationRecord
  validates :competency_id, :presence => true
  validates :competency_id, :uniqueness =>  {:scope => :activity_id}

  belongs_to :activity, optional: true
  belongs_to :competency, optional: true

end
