class UserJob < ApplicationRecord

  belongs_to :user_career
  belongs_to :user

  def getjob
    "#{job_title} at #{company}"
  end

end