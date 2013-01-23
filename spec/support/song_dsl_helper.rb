module SongDSLHelper
  class << self
    def song_info
      <<-EOF.gsub(/^\s+/,'')
    Title: Dear Prudence
    Artist: The Beatles
      EOF
    end

    def song_info_with_attributes
      <<-EOF.gsub(/^\s+/,'')
    Title: Dear Prudence
    Artist: The Beatles
    Album: The White Album
      EOF
    end
  end
end
