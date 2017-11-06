class User < ApplicationRecord
  has_many :user_careers
  has_many :activities
  has_many :user_jobs
  has_many :educations

=begin
    def self.sign_in_from_omniauth(auth)
      find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
    end

    def self.create_user_from_omniauth(auth)
      @role = ""
      if auth['info']['name'] == "Camilla Bontogon"
        @role = "admin"
      elsif auth['info']['name'] == "Karlo Tablizo"
        @role = "admin"
      else
        @role = "user"
      end

      create(
          provider: auth['provider'],
          uid: auth['uid'],
          name: auth['info']['name'],
          role: @role
      )
    end
=end
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)

        if user.name == "Camilla Bontogon"
          user.role = "admin"
        elsif user.name == "Karlo Tablizo"
          user.role = "admin"
        else
          user.role = "user"
        end

        user.save!
      end
    end

  def fullname
    "#{first_name} #{last_name}"
  end

end
