AllAboard.NewPerspectiveAssignmentController = Em.ArrayController.extend
  needs: "slide"

  slide: Em.computed ->
    @get("controllers.slide.content")
  .property("controllers.slide.content")

  actions:
    assign: (template) ->
      slide = @get("slide")
      @get("store")
        .createRecord(
          "perspective_assignment",
          slide: slide,
          template: template,
          column: 1,
          row: 1
        ).save()
