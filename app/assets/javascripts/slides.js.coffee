class SlideShow
  constructor: ->
    @container = $('#container')
    @container.css('overflow', 'hidden')
    @container.css('margin-top', ($(window).height() - @container.height()) / 2)
    slides = $('#slides').children('div')
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
    @progressText = $('<p id="progress"></p>')
    @progressBar = $('<div id="progress-bar"></div>').append(@progressText)
    @updateProgress()
    @container.after(@progressBar)

  next: ->
    if @currentSlide == @numberOfSlides
      return

    @move()

  previous: ->
    if @currentSlide == @firstPosition
      return
    
    @move(false)

  move: (right = true) ->
    if @container.is(':animated')
      return

    if right then @currentSlide++ else @currentSlide--

    @animate()
    @updateHash()
    @updateProgress()

  updateHash: ->
    location.hash = '#slide-' + @currentSlide

  updateProgress: ->
    @progress = @currentSlide + '/' + @numberOfSlides
    @progressText.text(@progress)

  animate: ->
    @container.animate({scrollLeft: (@currentSlide-1) * @slideWidth})

$(window).load( ->
  slideShow = new SlideShow()
)
