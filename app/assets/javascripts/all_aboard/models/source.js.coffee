AllAboard.Source = DS.Model.extend
  configurableAttributes: DS.hasMany("configurable_attribute")
  perspectives: DS.hasMany("perspective")
  name: DS.attr()
