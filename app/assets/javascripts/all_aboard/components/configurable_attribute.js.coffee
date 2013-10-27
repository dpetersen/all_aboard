AllAboard.ConfigurableAttributeComponent = Em.Component.extend
  submit: (e) ->
    e.preventDefault()
    @get("attribute").save()
