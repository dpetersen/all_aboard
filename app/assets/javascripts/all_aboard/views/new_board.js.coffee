AllAboard.NewBoardView = Em.View.extend
  submit: (e) ->
    e.preventDefault()
    @get("controller").createBoard()
