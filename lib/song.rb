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
  end

  def to_s
    "#{title} - #{artist}"
  end
end
