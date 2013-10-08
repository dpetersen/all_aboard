#= require jquery
#= require handlebars
#= require ember
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router

Em.LOG_VERSION = false

window.AllAboard = Em.Application.create
  LOG_TRANSITIONS: true
  #LOG_TRANSITIONS_INTERNAL: true

#AllAboard.Store = DS.Store.extend
#  revision: 11
#  adapter: DS.RESTAdapter.create()
