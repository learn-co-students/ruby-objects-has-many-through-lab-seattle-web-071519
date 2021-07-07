
class Genre

    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = songs
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select do |s| s.genre == self
        end
    end

 def artists
        songs.collect(&:artist)
    end

end
