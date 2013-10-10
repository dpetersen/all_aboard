AllAboard.BoardsRoute = Em.Route.extend
  model: ->
    @get("store").findAll("board")
