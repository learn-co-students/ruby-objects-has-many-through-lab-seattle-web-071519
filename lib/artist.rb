require "pry"
class Artist
    attr_reader :name
    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def Artist.all
        @@all
    end
    
    def new_song(song_name, genre)
        Song.new(song_name, self, genre)
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end
    
    def genres 
        genres = self.songs.collect do |song|
            song.genre
        end
        genres.uniq
    end

end