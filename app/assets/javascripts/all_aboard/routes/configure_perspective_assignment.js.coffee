AllAboard.ConfigurePerspectiveAssignmentRoute = Em.Route.extend
  model: (params) ->
    @get("store").find("perspective_assignment", params.assignment_id)
