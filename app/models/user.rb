class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookmarks,
    foreign_key: :author_id,
    dependent: :destroy,
    inverse_of: :author

  has_many :identities,
    dependent: :destroy,
    inverse_of: :user

  class << self
    def mass_assignable_attrs
      [:email, :avatar]
    end
  end
end
