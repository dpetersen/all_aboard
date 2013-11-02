AllAboard.Router.reopen
  location: "history"
  rootURL: AllAboard.rootURL

AllAboard.Router.map ()->
  @resource('sources')
  @resource('source', path: '/source/:source_id')

  @resource('boards')
  @resource('board', path: '/board/:board_id', ->
    @resource('slides')
    @resource('slide', path: '/slide/:slide_id', ->
      @resource('new_perspective_assignment')
      @resource('configure_perspective_assignment', path: '/configure/:assignment_id')
    )
  )
