class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files = []
    # @files = Dir.glob("#{@path}/*.mp3").collect{|file|
    #     file.gsub("#{@path}/", "")
    #   }
    Dir(.path).collect{|file|
      @files << file.ends_with(".mp3")
    }
    @files
  end
  
  def import
    self.files.each{|file|
      Song.new_by_filename(file)
    }
  end
end