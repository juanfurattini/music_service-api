class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration, :artist
  has_one :album
  has_one :musical_genre

  def artist
    object.artist.as_json(only: [:id, :name])
  end
end
