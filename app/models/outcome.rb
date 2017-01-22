class Outcomes < ApplicationRecord
  belongs_to :track
  belongs_to :user

  validates :track_id, presence: true
end
