class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookmarks,
    foreign_key: :author_id,
    dependent: :destroy,
    inverse_of: :author

  has_many :identities,
    dependent: :destroy,
    inverse_of: :user
end
