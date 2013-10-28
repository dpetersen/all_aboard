AllAboard.BoardController = Em.ObjectController.extend
  beginPayloadReloading: ->
    @fetchLater = Em.run.later(@, @fetchUpdate, AllAboard.updateFetchInterval)

  fetchUpdate: ->
    $.getJSON(
      AllAboard.updateURL,
      board_id: @get("model.id")
      (response) => @updateReceived(response)
    )

  updateReceived: (response) ->
    for o in response.payloads
      finder = @get("store").find("payload", o.id)
      @processUpdate(o.value, finder)
    @beginPayloadReloading()

  processUpdate: (value, finder) ->
    finder.then (payload) ->
      payload.setProperties(value: value)

  stopPayloadReloading: ->
    Em.run.cancel(@fetchLater)
