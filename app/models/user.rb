class User < ApplicationRecord
    include Clearance::User
    has_many :authentications, dependent: :destroy
    mount_uploader :avatars, AvatarUploader

    enum status: [:customer, :moderator, :superadmin]

  
       
        def self.create_with_auth_and_hash(authentication, auth_hash)
          user = self.create!(
            first_name: auth_hash["info"]["first name"],
            last_name: auth_hash["info"]["last name"],
            email: auth_hash["info"]["email"],
            # birth_date: auth_hash["info"]["birth date"]
            password: SecureRandom.hex(10)
          )
          user.authentications << authentication
          return user
        end
       
        # grab google to access google for user data
        def google_token
          x = self.authentications.find_by(provider: 'google_oauth2')
          return x.token unless x.nil?
            end
        end
       
  

#   validates :birth_date, presence: true

  

  private

  def validate_birth_date
      if birth_date.present? && birth_date < 18.years.ago.to_d
          errors.add(:birth_date, 'You should be over 18 years old.')
      end
  end

