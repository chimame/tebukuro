class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,# :validatable,
          :confirmable, :omniauthable, omniauth_providers: [:twitter]
  include DeviseTokenAuth::Concerns::User

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.username = auth.info.nickname
      user.email = auth.info.email
    end
  end
end
