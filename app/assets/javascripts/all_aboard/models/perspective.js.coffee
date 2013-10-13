AllAboard.Perspective = DS.Model.extend
  source: DS.belongsTo("source")
  templates: DS.hasMany("template")
  name: DS.attr()
  description: DS.attr()
