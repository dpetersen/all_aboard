AllAboard.SlidesRoute = Em.Route.extend
  model: ->
    @modelFor("board").get("slides")

  afterModel: (slides) ->
    if slides.get("length") > 0
      @transitionTo("slide", @modelFor("board"), slides.get("firstObject"))
