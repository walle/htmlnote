class SlidesController < ApplicationController
  def index
    slideshow = params[:slideshow]
    slideshow ||= 'sample'
    @slides = Slide.find(slideshow)
  end
end
