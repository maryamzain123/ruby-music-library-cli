class MusicImporter

    attr_accessor :path
    
    def initialize(path)
      @path=path
    end
    
    def path
      @path
    end
    
    def files
      file=Dir.glob("#{path}/*.mp3").collect do |file|
        file.scan (/mp3s\/(.*)/)
      end
      file.flatten(2)
    end
    
    def import
      self.files.collect {|file|Song.create_from_filename(file)}
    end
    
    
    
    end