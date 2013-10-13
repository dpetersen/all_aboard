AllAboard.Slide = DS.Model.extend
  board: DS.belongsTo("board")
  perspectiveAssignments: DS.hasMany("perspective_assignment")
