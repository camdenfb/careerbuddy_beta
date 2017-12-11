class Skill < ApplicationRecord
  validates :skill_title, :presence => true
  validates :skill_title, :uniqueness => true

  has_many  :competency_skills

  def self.search(query)
    where("skill_title like ?", "%#{query}%")
  end

end
