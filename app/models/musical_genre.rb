class MusicalGenre < ApplicationRecord
  has_many :artists
  has_many :albums
  has_many :songs
  validates :name, presence: true, uniqueness: true
end
