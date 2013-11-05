AllAboard.PerspectiveAssignmentComponent = Em.Component.extend
  tagName: "li"
  classNames: [ "perspective-assignment" ]
  attributeBindings: [
    "assignment.row:data-row",
    "assignment.column:data-col",
    "assignment.template.width:data-sizex",
    "assignment.template.height:data-sizey",
    "inlineStyle:style"
  ]

  backgroundColors: [ "468966", "FFB03B", "B64926", "8E2800" ]

  inlineStyle: Em.computed ->
    i = Math.floor(Math.random() * @backgroundColors.length)
    color = @backgroundColors[i]
    "background-color: ##{color}"
  .property()

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
