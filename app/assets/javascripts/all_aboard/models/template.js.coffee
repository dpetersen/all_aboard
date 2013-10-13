AllAboard.Template = DS.Model.extend
  perspective: DS.belongsTo("perspective")
  width: DS.attr("number")
  height: DS.attr("number")
