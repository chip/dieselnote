module DieselNote
# Song Class
#
# A song requires a title & artist.  Additionally,
# it can build dynamic attributes such as Genre, Date, Album, 
# or any the user wishes to create on the fly.
#
# Usage: song = Song.new('Dear Prudence')
# song.artist('The Beatles')
# song.album('The White Album')
# song.year(1968)
#
# song.info => "Title: Dear Prudence\n
#               Artist: The Beatles\n
#               Album: The White Album\n
#               Year: 1968"
#
  class Song
    attr_reader :title

    def initialize(title)
      @title = title
      @attributes = {}
    end

    def show_info
      <<-EOF.gsub(/^\s+/,'')
        Title: #{title}
        #{attributes_info.join("\n")}
      EOF
    end

    private
    def method_missing(method, arg)
      @attributes[method] = arg
    end

    def attributes_info
      @attributes.map { |attr| key,val=attr; "#{key.to_s.capitalize}: #{val}" }
    end
  end
end
