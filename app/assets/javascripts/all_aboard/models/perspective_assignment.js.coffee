AllAboard.PerspectiveAssignment = DS.Model.extend
  slide: DS.belongsTo("slide")
  template_id: DS.attr("")
  column: DS.attr("number")
  row: DS.attr("number")
