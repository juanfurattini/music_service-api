class Song < ApplicationRecord
  include AttachmentSupport
  belongs_to :musical_genre
  belongs_to :album
  belongs_to :artist
  has_attached_file :audio, path: ":rails_root/public/system/:class/:attachment/:id_partition/:basename.:extension"
  validates_attachment_content_type :audio, content_type: AttachmentSupport::MIME_TYPE_EXTENSIONS.select { |mime, data| data[:type] == 'audio' }.keys
  validates :name, presence: true

  def file_name_prepend
    "#{self.artist.name.downcase.split.map(&:first).join}-"
  end

  def attachment_attribute_name
    :audio
  end
end
