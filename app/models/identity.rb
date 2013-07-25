class Identity < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :identities

  validates_presence_of :uid
  validates_presence_of :provider
  validates_presence_of :user

  class << self
    def find_by_auth_hash(hash)
      includes(:user).
      where({
        provider: hash['provider'],
        uid: hash['uid']
      }).first
    end

    def build_from_auth_hash(hash)
      Identity.new do |identity|
        identity.uid = hash['uid']
        identity.provider = hash['provider']
        identity.build_user do |user|
          user.email = hash['info'].try(:[], 'email')
          user.password = Devise.friendly_token
          user.password_confirmation = user.password
        end
      end
    end
  end
end
