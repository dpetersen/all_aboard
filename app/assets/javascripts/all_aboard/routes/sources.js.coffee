AllAboard.SourcesRoute = Em.Route.extend
  model: ->
    @get("store").findAll("source")
