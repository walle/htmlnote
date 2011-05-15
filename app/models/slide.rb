class Slide

  def initialize(file)
    @file = file
  end

  def self.find(slideshow)
    unless Dir.exists? "data/#{slideshow}"
      raise ActionController::RoutingError.new('Not Found')
    end

    files = Dir.glob("data/#{slideshow}/*.html")
    files = files.map do |file|
      Slide.new file
    end

    files.sort { |a,b| a.id.to_i <=> b.id.to_i }
  end

  def contents
    File.read(@file).html_safe
  end

  def id
    File.basename @file, '.html'
  end

end
