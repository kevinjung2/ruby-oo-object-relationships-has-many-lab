require 'pry'

class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    self.name = name
    @@all << self
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def add_song(song)
    song.artist = self
  end

  def add_song_by_name(name)
    new = Song.new(name)
    new.artist = self
    Song.all << new
    new
  end

  def self.song_count
    # binding.pry
    Song.all.uniq.count { |song| @@all.include?(song.artist) }
  end

end
