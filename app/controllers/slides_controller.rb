class SlidesController < ApplicationController
  def index
    @slides = Slide.find('gimli')
  end
end
