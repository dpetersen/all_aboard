AllAboard.PerspectiveAssignment = DS.Model.extend
  slide: DS.belongsTo("slide")
  template: DS.belongsTo("template")
  payload: DS.belongsTo("payload")
  configurableAttributes: DS.hasMany("configurable_attribute")
  column: DS.attr("number")
  row: DS.attr("number")
