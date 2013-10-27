AllAboard.NewPerspectiveAssignmentController = Em.ArrayController.extend
  needs: "slide"

  actions:
    assign: (template) ->
      slide = @get("controllers.slide.content")
      @get("store")
        .createRecord(
          "perspective_assignment",
          slide: slide,
          template: template,
          column: 1,
          row: 1
        ).save()
