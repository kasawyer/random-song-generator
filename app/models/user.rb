class User < ApplicationRecord
  has_many :outcomes

  validates :provider, presence: true
  validates :uid, presence: true
  validates :username, presence: true
  validates :email
end
