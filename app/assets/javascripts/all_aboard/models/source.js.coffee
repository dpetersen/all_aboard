AllAboard.Source = DS.Model.extend
  configurableAttributes: DS.hasMany("configurable_attribute")
  name: DS.attr()
