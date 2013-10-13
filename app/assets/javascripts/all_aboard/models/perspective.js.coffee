AllAboard.Perspective = DS.Model.extend
  templates: DS.hasMany("template")
  source: DS.belongsTo("source")
  name: DS.attr()
  description: DS.attr()
