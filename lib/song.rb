class Song 
  attr_accessor :name, :artist
  @@all = []
  
  def initialize(name)
    @name = name 
    save
  end
  
  def save
    @@all << self
  end
  def self.all 
    @@all
  end
  
  def self.new_by_filename(file)
    splitup = file.chomp(".mp3").split(" - ")
    song = Song.new(splitup[1])
    song.artist_name = splitup[0]
    song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
    artist.songs
  end
end