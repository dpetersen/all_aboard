AllAboard.NewPerspectiveAssignmentRoute = Em.Route.extend
  model: ->
    @get("store").findAll("source")
