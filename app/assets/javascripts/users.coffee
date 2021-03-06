# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
  return unless $(".users.show").length > 0
  root = exports ? this
  root.grid=$('.dashboard-grid').isotope({
    itemSelector: '.grid-item',
    percentPosition: true
  })
  root.grid.imagesLoaded().progress(->
    root.grid.isotope('layout')
  )
