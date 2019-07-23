class Genre
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def Genre.all
        @@all
    end

    def songs
        Song.all.select do |song|
            song.genre == self
        end
    end

    def artists
        artists = self.songs.collect do |song|
            song.artist
        end
        artists.uniq
    end
end