AllAboard.Router.reopen
  location: "history"
  rootURL: AllAboard.rootURL

AllAboard.Router.map ()->
  @resource('sources', ->
    @resource('source', path: ':source_id')
  )

  @resource('boards')
  @resource('board', path: '/board/:board_id', ->
    @resource('slides')
    @resource('slide', path: '/slide/:slide_id', ->
      @resource(
        'configure_perspective_assignment',
        path: '/configure/:assignment_id'
      )
    )
  )
