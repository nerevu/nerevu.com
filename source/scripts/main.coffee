Hamburger = require './hamburger'

loadJS = (e) ->
  console.log 'DOM ready'
  Menu = new Hamburger()
  Menu.activate()

if document.readyState is 'complete'
  loadJS()
else
  window.onload = loadJS
