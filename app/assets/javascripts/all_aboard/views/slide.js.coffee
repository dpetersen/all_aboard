AllAboard.SlideView = Em.View.extend
  reordered: ->
    console.info "Reordered", @gridster().serialize()
    debugger
    @get("controller").updateAssignmentPositions(@gridster().serialize())

  # Gridster has its hooks into the DOM pretty hard and can't be told to
  # re-grid after it has already done so.  We have to toss everything out and
  # start from scratch.
  assignmentsChanged: (->
    @rerender()
  ).observes("controller.perspectiveAssignments.length")

  didInsertElement: ->
    @$(".gridster ul").gridster
      widget_margins: [ 10, 10 ]
      widget_base_dimensions: [ 140, 140 ]
      avoid_overlapped_widgets: true
      draggable:
        stop: => @reordered()

    if @get("controller.perspectiveAssignments.length") == 0
      @get("controller").set("showPerspectivePalette", true)

  assignmentsSavingChanged: ( ->
    return null unless @gridster()?

    if @get("controller.assignmentsSaving")
      @gridster().disable()
    else @gridster().enable()
  ).observes("controller.assignmentsSaving")

  gridster: ->
    list = @$(".gridster ul")
    if list?
      list.gridster().data('gridster')
