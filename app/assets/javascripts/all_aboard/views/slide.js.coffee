AllAboard.SlideView = Em.View.extend
  reordered: ->
    @get("controller").updateAssignmentPositions(@gridster().serialize())

  didInsertElement: ->
    @$(".gridster ul").gridster
      widget_margins: [ 10, 10 ]
      widget_base_dimensions: [ 140, 140 ]
      draggable:
        stop: => @reordered()

  assignmentsSavingChanged: ( ->
    return null unless @gridster()?

    if @get("controller.assignmentsSaving")
      @gridster().disable()
    else
      @gridster().enable()
  ).observes("controller.assignmentsSaving")

  gridster: ->
    list = @$(".gridster ul")
    if list?
      list.gridster().data('gridster')
