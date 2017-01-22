class Track < ApplicationRecord
  has_many :outcomes

  validates :artist, presence: true
  validates :album, presence: true
  validates :track, presence: true
end
