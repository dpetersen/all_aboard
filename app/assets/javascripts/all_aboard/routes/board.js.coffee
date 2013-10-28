AllAboard.BoardRoute = Em.Route.extend
  setupController: (controller, model) ->
    @_super(controller, model)
    controller.beginPayloadReloading()

  exit: ->
    @get("controller").stopPayloadReloading()
