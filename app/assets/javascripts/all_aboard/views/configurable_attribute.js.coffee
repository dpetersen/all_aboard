AllAboard.ConfigurableAttributeView = Em.View.extend
  submit: (e) ->
    e.preventDefault()
    @get("controller").saveConfigurableAttribute()
