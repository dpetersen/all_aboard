AllAboard.SlidesRoute = Em.Route.extend
  model: ->
    # FIXME: So this is great, except that it doesn't work on a Board that was
    # created by the app while that same instance is still running.  It just
    # sits and hangs resolving the model.
    @modelFor("board").get("slides")

  afterModel: (slides) ->
    if slides.get("length") > 0
      @transitionTo("slide", @modelFor("board"), slides.get("firstObject"))
