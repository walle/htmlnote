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

    @move()

  previous: ->
    if @currentSlide == @firstPosition
      return
    
    @move(false)

  move: (right = true) ->
    if @slides.is(':animated')
      return

    if right then @currentSlide++ else @currentSlide--
    
    @updateHash()
    @animate()

  updateHash: ->
    location.hash = '#slide-' + @currentSlide

  animate: ->
    @slides.animate({scrollLeft: (@currentSlide-1) * @slideWidth})

$(window).load( ->
  slideShow = new SlideShow()
)
