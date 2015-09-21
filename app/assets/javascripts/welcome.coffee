# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
# notAllowed = (e) ->
#   @selections = $('td.selected')
#
#   if @selections.size() > 4
#     return true
#   else
#     return false
#
# siblingSelected = (e) ->
#   return true if $(e.currentTarget).siblings('td.selected').size() > 0
#
# wigglePicks = ->
#   return this
#
# $ ->
#   $('.data-row td.team-abbr').on('click', (e) ->
#     if $(e.currentTarget).hasClass('selected')
#       $(e.currentTarget).removeClass('selected')
#     else if siblingSelected(e)
#       $(e.currentTarget).siblings('td.selected').removeClass('selected')
#       $(e.currentTarget).addClass('selected')
#     else if notAllowed(e)
#       wigglePicks()
#       return true
#     else
#       $(e.currentTarget).addClass('selected')
#   )
