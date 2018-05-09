class Artist < ApplicationRecord
  belongs_to :musical_genre
  has_many :songs
  has_many :albums
  validates :name, presence: true
end
