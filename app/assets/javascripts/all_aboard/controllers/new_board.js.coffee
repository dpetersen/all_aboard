AllAboard.NewBoardController = Em.Controller.extend
  createBoard: ->
    @get("store")
      .createRecord("board", name: @get("name"))
      .save()
