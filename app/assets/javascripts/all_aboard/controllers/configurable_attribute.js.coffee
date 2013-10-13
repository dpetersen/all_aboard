AllAboard.ConfigurableAttributeController = Em.ObjectController.extend
  saveConfigurableAttribute: ->
    @get("model").save()
