class Setting < ApplicationRecord
  validates :required_skill_multiplier, :preferred_skill_multiplier, :desired_skill_multiplier, :total_career_hours, :total_skill_hours, :hours_in_a_day, :presence => true
end
