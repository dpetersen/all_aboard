AllAboard.Slide = DS.Model.extend
  board: DS.belongsTo("board")
  position: DS.attr("number")
  perspectiveAssignments: DS.hasMany("perspective_assignment")
