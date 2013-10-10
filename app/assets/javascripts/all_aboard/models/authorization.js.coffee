AllAboard.Authorization = Em.Object.extend
  implementingAppLoginPath: Em.computed ->
    $("body").data("implementingAppLoginPath")
  .cacheable()

  canManageBoards: Em.computed ->
    $("body").data("can-manage-boards")?
  .cacheable()
