module AttachmentSupport
  extend ActiveSupport::Concern

  MIME_TYPE_EXTENSIONS = {
      'image/gif' => { extensions: %w(gif), type: 'image'},
      'image/x-icon' => { extensions: %w(ico), type: 'image'},
      'image/jpeg' => { extensions: %w(jpg jpe jpeg), type: 'image'},
      'image/tiff' => { extensions: %w(tif tiff), type: 'image'},
      'image/png' => { extensions: %w(png), type: 'image'},
      'image/bmp' => { extensions: %w(bmp), type: 'image'},
      'audio/x-wav' => { extensions: %w(wav), type: 'audio'},
      'audio/mpeg' => { extensions: %w(mp3), type: 'audio'},
      'audio/x-mpeg' => { extensions: %w(mp3), type: 'audio'},
      'audio/mp3' => { extensions: %w(mp3), type: 'audio'},
      'audio/x-mp3' => { extensions: %w(mp3), type: 'audio'},
      'audio/mpeg3' => { extensions: %w(mp3), type: 'audio'},
      'audio/x-mpeg3' => { extensions: %w(mp3), type: 'audio'},
      'audio/mpg' => { extensions: %w(mp3), type: 'audio'},
      'audio/x-mpg' => { extensions: %w(mp3), type: 'audio'},
      'audio/x-mpegaudio' => { extensions: %w(mp3), type: 'audio'}
  }

  included do
    before_save :before_save_callback
  end

  def before_save_callback
    attachment = attachment_attribute_name
    return true unless self.respond_to?(attachment.to_s)
    self.send(
        "#{attachment.to_s}_file_name=".to_sym,
        "#{file_name_prepend}#{self.name.downcase.strip}.#{mime_extension(self.art_content_type)}".gsub(/\s+/, '_')
    ) if self.send(attachment.to_sym) && self.send("#{attachment.to_s}_content_type".to_sym)
  end

  def mime_extension(mime_type = nil)
    return nil unless mime_type.present? && mime_type.is_a?(String)
    MIME_TYPE_EXTENSIONS[mime_type.downcase]&.first
  end

  def file_name_prepend
    ''
  end

  def attachment_attribute_name
    :attachment
  end
end
