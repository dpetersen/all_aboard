AllAboard.Router.reopen
  location: "history"
  rootURL: AllAboard.rootURL

AllAboard.Router.map ()->
  @resource('boards')
