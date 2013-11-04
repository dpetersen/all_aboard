AllAboard.PerspectiveAssignmentComponent = Em.Component.extend
  tagName: "li"
  classNames: [ "perspective-assignment" ]
  attributeBindings: [
    "assignment.row:data-row",
    "assignment.column:data-col",
    "assignment.template.width:data-sizex",
    "assignment.template.height:data-sizey"
  ]

  templateName: Em.computed ->
    @get("assignment.template.templateName")
  .property("assignment.template.templateName")

  didInsertElement: ->
    @get("parentView").reordered()

  actions:
    remove: ->
      assignment = @get("assignment")
      assignment.deleteRecord()
      @get("slide.perspectiveAssignments").removeObject(assignment)
      assignment.save()
