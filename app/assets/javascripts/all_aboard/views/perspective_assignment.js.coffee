AllAboard.PerspectiveAssignmentView = Em.View.extend
  tagName: "li"
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
