AllAboard.Router.reopen
  location: "history"
  rootURL: AllAboard.rootURL

AllAboard.Router.map ()->
  @resource('sources')

  @resource('boards')
  @resource('board', path: '/board/:board_id')
