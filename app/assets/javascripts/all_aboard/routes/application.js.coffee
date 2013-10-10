AllAboard.ApplicationRoute = Em.Route.extend
  redirect: ->
    @transitionTo("boards")
