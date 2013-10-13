AllAboard.PerspectiveAssignment = DS.Model.extend
  slide: DS.belongsTo("slide")
  template: DS.belongsTo("template")
  column: DS.attr("number")
  row: DS.attr("number")

  # Trying to access the template attribute in handlebars, but template is a
  # helper (deprecated but still works) and so it freaks out on me.  So
  # "rename" it here so I can access it.
  templateHack: Em.computed ->
    @get("template")
  .property("template")
