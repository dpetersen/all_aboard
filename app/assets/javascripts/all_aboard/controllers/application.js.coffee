AllAboard.ApplicationController = Em.Controller.extend
  implementingAppLoginPath: Em.computed ->
    $("body").data("implementingAppLoginPath")
  .cacheable()

  canManageBoards: Em.computed ->
    $("body").data("can-manage-boards")?
  .cacheable()
