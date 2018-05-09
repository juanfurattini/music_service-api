class Album < ApplicationRecord
  include AttachmentSupport
  belongs_to :musical_genre
  belongs_to :artist
  has_many :songs
  has_attached_file :art, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", path: ":rails_root/public/system/:class/:attachment/:id_partition/:style/:basename.:extension"
  validates_attachment_content_type :art, content_type: AttachmentSupport::MIME_TYPE_EXTENSIONS.select { |mime, data| data[:type] == 'image' }.keys
  validates :name, presence: true

  def file_name_prepend
    "#{self.artist.name.downcase.split.map(&:first).join}-"
  end

  def attachment_attribute_name
    :art
  end
end
