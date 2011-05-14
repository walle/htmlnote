class SlideShow
  constructor: (@numberOfSlides, containerId) ->
    this.container = $("#"+containerId)

  keyPress: ->
    $(document.body).keydown( (e) ->
      if (e.keyCode == 39 || e.keyCode == 37)
        e.preventDefault()
        if e.keyCode == 39 then this.next() else this.prev()
    )
