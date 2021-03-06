require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files = Dir.glob("#{path}/*.mp3") # get the .mp3 files
    @files.map! do |file|
      file = file.sub('./spec/fixtures/mp3s/', '') # remove ./spec/fixtures/mp3s/
    end
  end

  def import
    self.files # get the .mp3 files
    @files.each do |file|
      Song.new_by_filename(file) # send the filenames to the Song class
    end
  end

end
