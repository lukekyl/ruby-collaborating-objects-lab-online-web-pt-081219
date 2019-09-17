class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files = []
    Dir.foreach(path) do |file|
      @files << file if file.end_with?(".mp3")
    end
    @files
    
    # @files = Dir.glob("#{@path}/*.mp3").collect{|file|
    #     file.gsub("#{@path}/", "")
    #   }
  end
  
  def import
    self.files.each{|file|
      Song.new_by_filename(file)
    }
  end
end