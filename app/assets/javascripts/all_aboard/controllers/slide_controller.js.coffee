AllAboard.SlideController = Em.ObjectController.extend
  assignmentsSaving: Em.computed ->
    @get("perspectiveAssignments").anyBy("isSaving", true)
  .property("perspectiveAssignments.@each.isSaving")

  updateAssignmentPositions: (data) ->
    @get("perspectiveAssignments").forEach (assignment) =>
      index = @get("perspectiveAssignments").indexOf(assignment)
      position = data[index]
      @updateAssignment(assignment, position.col, position.row)

  updateAssignment: (assignment, column, row) ->
    assignment.setProperties(column: column, row: row)
    assignment.save() if assignment.get("isDirty") && assignment.get("id")
