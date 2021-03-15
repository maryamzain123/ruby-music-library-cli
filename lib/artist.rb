class Artist

    extend Concerns::Findable
    @@all=[]
    
    attr_accessor :name, :songs
    
    
    
    def initialize(name)
      @name=name
      @songs=[]
    end
    
    def self.all
       @@all
    end
    
    def self.destroy_all
        @@all.clear
    end
    
    def save
      self.class.all<<self #unless self.class.all.include?(self)
    end
    def self.create(name)
      artist=Artist.new(name)
      artist.save
      artist
    end
    def add_song(song)
      if song.class==Song
        @songs<<song unless @songs.include?(song)
        song.artist=self unless song.artist
      end
      end
    def genres
      @songs.collect {|song|song.genre}.uniq
    end

    
    end