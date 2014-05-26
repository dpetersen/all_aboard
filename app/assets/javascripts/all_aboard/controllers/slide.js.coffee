AllAboard.SlideController = Em.ObjectController.extend
  sources: (Em.computed ->
    @get("store").findAll("source")
  ).property()

  assignmentsSaving: (Em.computed ->
    @get("perspectiveAssignments").anyBy("isSaving", true)
  ).property("perspectiveAssignments.@each.isSaving")

  updateAssignmentPositions: (data) ->
    @get("perspectiveAssignments").forEach (assignment) =>
      index = @get("perspectiveAssignments").indexOf(assignment)
      position = data[index]
      @updateAssignment(assignment, position.col, position.row)

  updateAssignment: (assignment, column, row) ->
    console.info "Updating assignment", column, row, assignment.get("isDirty"), assignment.get("id")
    assignment.setProperties(column: column, row: row)
    assignment.save() if assignment.get("isDirty") && assignment.get("id")

  showPerspectivePalette: false

  actions:
    togglePerspectivePalette: ->
      if @showPerspectivePalette
        @set("showPerspectivePalette", false)
      else
        @set("showPerspectivePalette", true)

    assign: (template) ->
      @get("store")
        .createRecord(
          "perspectiveAssignment",
          slide: @get("model"),
          template: template,
          column: 1,
          row: 1
        ).save()
