class Activity < ApplicationRecord
  validates :activity_details, :activity_start, :activity_type, :presence => true

  belongs_to :user
  belongs_to :job, optional: true
  has_many :activity_competencies, dependent: :destroy

  attr_accessor :_time, :_time_unit

  accepts_nested_attributes_for :activity_competencies, :allow_destroy => true
end
