class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio
  has_one :musical_genre
end
