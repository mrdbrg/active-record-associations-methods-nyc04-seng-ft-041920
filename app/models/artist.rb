class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    # Returns the genre of the artist's first saved song (maybe the #get_first_song method can be used here?)
    Genre.all.find do |genre|
      genre.id == self.songs.first.genre_id
    end
  end

  def song_count
    #return the number of songs associated with the artist
    self.songs.count
  end

  def genre_count
    #return the number of genres associated with the artist
    Genre.all.find_all do |genre|
      genre.id == self.songs.first.genre_id
    end.count
  end
end