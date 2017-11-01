class Career < ApplicationRecord
  validates :career_title, :presence => true
  validates :career_title, :uniqueness => true

  has_many :user_careers

  def self.search(query)
    where("career_title like ?", "%#{query}%")
  end
end
