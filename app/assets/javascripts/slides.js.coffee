class SlideShow
  constructor: ->
    @container = $('#container')
    @container.css('overflow', 'hidden')
    @container.css('margin-top', ($(window).height() - @container.height()) / 2)
    slides = $('#slides').children('div')
    @numberOfSlides = slides.length
    @slideWidth = slides.width() + parseInt(slides.css('margin-right'), 10)
    @firstPosition = 1
    @currentSlide = @loadFromHash()
    @hoveredSlide = @currentSlide
    self = this
    $(document).keydown((e) ->
      if e.keyCode == 39 || e.keyCode == 37
        e.preventDefault()
        if e.keyCode == 39
          self.next()
        else
          self.previous()
    )
    $(window).bind( 'hashchange', ->
      self.currentSlide = self.loadFromHash()
      self.updatePosition(self.currentSlide)
    )
    @tooltip = $('<div id="tooltip"></div>').hide()
    @progressText = $('<p id="progress"></p>')
    @progressBar = $('<div id="progress-bar"></div>').append(@progressText)
    @updatePosition(@currentSlide)
    @container.after(@tooltip).after(@progressBar)
    @progressBar.mousemove((e) ->
      x = e.pageX - this.offsetLeft
      self.hoveredSlide = Math.round(x / (self.progressBar.width()/self.numberOfSlides))
      self.tooltip.text('Slide ' + self.hoveredSlide)
        .css('bottom', parseInt($(this).css('top')) - 10)
        .css('left', x)
    )
    @progressBar.click((e) ->
      self.updatePosition(self.hoveredSlide)
    )
    @progressBar.mouseenter((e) ->
      self.tooltip.show()
    )
    @progressBar.mouseleave((e) ->
      self.tooltip.hide()
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
    if @container.is(':animated')
      return
    if right then @currentSlide++ else @currentSlide--
    @updatePosition(@currentSlide)
    
  updatePosition: (slide) ->
    @currentSlide = slide
    @animate()
    @updateHash()
    @updateProgress()

  updateHash: ->
    location.hash = '#slide-' + @currentSlide

  loadFromHash: ->
    if location.hash == ''
      return 1
    str = location.hash
    parseInt(str.replace('#slide-', ''))

  updateProgress: ->
    @progress = @currentSlide + '/' + @numberOfSlides
    @progressText.text(@progress)
    @progressText.width(Math.floor(@currentSlide/@numberOfSlides * @progressBar.width()))

  animate: ->
    @container.animate({scrollLeft: (@currentSlide-1) * @slideWidth})

$(window).load( ->
  slideShow = new SlideShow()
)
