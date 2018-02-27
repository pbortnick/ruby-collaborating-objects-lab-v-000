class Song
  attr_accessor :artist, :name

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1]
    new_song = self.new(song_name)
    new_song.artist_name = artist_name
    new_song
  end

# def self.new_by_filename(file)
#       parts = file.split(" - ")
#       artist_name = parts[0]
#       song_name = parts[1]
#       #genre_name = parts[2].gsub(".mp3", "")

#       song = self.new(song_name)
#       song.artist = artist_name
#       song

#       # a = Artist.find_or_create_by_name(artist_name)
#       # a.add_song(self.new(song_name))
#   end
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
