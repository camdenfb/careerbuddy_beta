class Competency < ApplicationRecord
  validates :competency_title, :presence => true
  validates :competency_title, :uniqueness => true
  has_many :competency_skills, dependent: :destroy
  has_many :activity_competencies

  accepts_nested_attributes_for :competency_skills, :allow_destroy => true

  def self.search(query)
    where("competency_title like ?", "%#{query}%")
  end
end
