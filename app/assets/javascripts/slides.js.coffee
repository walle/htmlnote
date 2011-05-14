class SlideShow
  constructor: ->
    $('#container').css('overflow', 'hidden')
    @slides = $("#slides")
    slides = @slides.children('div')
    @numberOfSlides = slides.length
    @slideWidth = slides.width() + parseInt(slides.css('margin-right'), 10)
    @firstPosition = 1
    @currentSlide = @firstPosition
    self = this
    $(document).keydown((e) ->
      if e.keyCode == 39 || e.keyCode == 37
        e.preventDefault()
        if e.keyCode == 39
          self.next()
        else
          self.previous()
    )

  next: ->
    if @currentSlide == @numberOfSlides
      return

    @currentSlide++
    @updateHash()
    @animate()

  previous: ->
    if @currentSlide == @firstPosition
      return

    @currentSlide--
    @updateHash()
    @animate()

  updateHash: ->
    location.hash = '#slide-' + @currentSlide

  animate: ->
    if @slides.is(':animated')
      return

    @slides.animate({scrollLeft: (@currentSlide-1) * @slideWidth}, 1500)

$( ->
  slideShow = new SlideShow()
)
