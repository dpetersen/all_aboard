AllAboard.ConfigurableAttribute = DS.Model.extend
  source: DS.belongsTo("source")
  name: DS.attr()
  description: DS.attr()
  value: DS.attr()
