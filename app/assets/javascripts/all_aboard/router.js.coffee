AllAboard.Router.reopen
  location: "history"
  rootURL: AllAboard.rootURL

AllAboard.Router.map ()->
  @resource('sources')
  @resource('source', path: '/source/:source_id')

  @resource('boards')
  @resource('board', path: '/board/:board_id')
