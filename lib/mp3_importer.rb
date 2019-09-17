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
    Dir.foreach(path) do |file|
      @files << file if file.end_with?(".mp3")
    end
    @files
  end
  
  def import
    self.files.each{|file|
      Song.new_by_filename(file)
    }
  end
end