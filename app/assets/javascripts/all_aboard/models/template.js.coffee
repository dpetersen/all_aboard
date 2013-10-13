AllAboard.Template = DS.Model.extend
  source: DS.belongsTo("perspective")
  width: DS.attr("number")
  height: DS.attr("number")
