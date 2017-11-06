class UserJob < ApplicationRecord
  validates :company, :job_title, :job_start, :presence => true

  belongs_to :user_career
  belongs_to :user

  def getjob
    "#{job_title} at #{company}"
  end

end