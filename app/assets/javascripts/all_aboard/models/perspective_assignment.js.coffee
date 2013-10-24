AllAboard.PerspectiveAssignment = DS.Model.extend
  slide: DS.belongsTo("slide")
  template: DS.belongsTo("template")
  column: DS.attr("number")
  row: DS.attr("number")
