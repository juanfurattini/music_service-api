module ImageSupport
  extend ActiveSupport::Concern

  MIME_TYPE_EXTENSIONS = {
      'image/gif' => %w(gif),
      'image/x-icon' => %w(ico),
      'image/jpeg' => %w(jpg jpeg),
      'image/svg+xml' => %w(svg),
      'image/tiff' => %w(tif tiff),
      'image/webp' => %w(webp),
      'image/png' => %w(png),
      'image/bmp' => %w(bmp)
  }

  def mime_extension(mime_type = nil)
    return nil unless mime_type.present? && mime_type.is_a?(String)
    MIME_TYPE_EXTENSIONS[mime_type.downcase]&.first
  end
end
