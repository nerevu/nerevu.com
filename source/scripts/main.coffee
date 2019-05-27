Hamburger = require './hamburger'

loadJS = (e) ->
  console.log 'DOM ready'
  Menu = new Hamburger()
  Menu.activate()
  navbar = document.getElementById 'navbar'

  for link in navbar.getElementsByTagName 'a'
    link.onclick = Menu.close

if document.readyState is 'complete'
  loadJS()
else
  window.onload = loadJS
