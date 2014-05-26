AllAboard.Template = DS.Model.extend
  perspective: DS.belongsTo("perspective")
  markup: DS.attr()
  width: DS.attr("number")
  height: DS.attr("number")

  templateName: (Em.computed ->
    # Turns out that ':' isn't allowed in template names.
    compatibleName = @get("id").replace(/:/g, "/")
    # TODO: This probably isn't the place for this...
    Em.TEMPLATES[compatibleName] = Em.Handlebars.compile(@get("markup"))
    compatibleName
  ).property("id", "markup").cacheable()
