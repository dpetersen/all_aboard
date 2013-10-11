AllAboard.Board = DS.Model.extend
  slides: DS.hasMany("slide", async: true)
  name: DS.attr()
