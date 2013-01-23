# Song Class
#
# A song requires a title & artist
# However, it can build dynamic attributes such as
# Genre, Date, Album, or any the user wishes to create
# on the fly
#
class Song
  attr_reader :title
  attr_accessor :artist

  def initialize(title)
    @title = title
    @attributes = {}
  end

  def info
    <<-EOF.gsub(/^\s+/,'')
    Title: #{title}
    Artist: #{artist}
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
