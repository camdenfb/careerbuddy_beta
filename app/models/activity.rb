class Activity < ApplicationRecord

  belongs_to :user
  belongs_to :job, optional: true
  has_many :activity_skills, dependent: :destroy

  attr_accessor :_time, :_time_unit

  accepts_nested_attributes_for :activity_skills, :allow_destroy => true
end
