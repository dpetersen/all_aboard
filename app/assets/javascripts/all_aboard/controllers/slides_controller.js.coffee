AllAboard.SlidesController = Em.ArrayController.extend
  needs: "board"

  slideInFlight: false

  actions:
    createSlide: ->
      board = @get("controllers.board.content")

      @get("store")
        .createRecord(
          "slide",
          board: board
          position: 1
        ).save().then (slide) =>
          board.get("slides").addObject(slide)
          @set("slideInFlight", false)
          @transitionToRoute("slide", board, slide)

      @set("slideInFlight", true)
