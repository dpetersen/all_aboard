#= require jquery
#= require jquery.gridster

$ ->
  $(".gridster ul").gridster
    widget_margins: [10, 10],
    widget_base_dimensions: [140, 140]

  woo = $("<li id='woo'>Woo!</li>").appendTo(".gridster ul")
  gridster = $(".gridster ul").gridster().data('gridster')
  gridster.add_widget(woo, 2, 2)
