AllAboard.IndexRoute = Em.Route.extend
  redirect: ->
    @transitionTo("boards")
