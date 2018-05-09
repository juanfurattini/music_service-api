class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :art, :artist
  has_one :musical_genre

  def artist
    object.artist.as_json(only: [:id, :name])
  end
end
