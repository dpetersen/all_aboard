AllAboard.ConfigurePerspectiveAssignmentRoute = Em.Route.extend
  model: (params) ->
    @get("store").find("perspectiveAssignment", params.assignment_id)
