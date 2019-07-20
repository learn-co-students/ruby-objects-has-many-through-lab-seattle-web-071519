require 'pry'

class Artist
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def new_song(song_title, genre)
        Song.new(song_title, self, genre)
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def genres
        self.songs.collect do |song|
            song.genre
        end
    end
end