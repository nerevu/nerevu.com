m = require 'mithril'
Base = require './_components/base'
LaicosIcons = require './_components/laicos-icons'

module.exports =
  ctrl: (file, metalsmith) ->
    if file.subtitle
      title = "#{file.title} | #{file.subtitle}"
    else
      title = file.title

    @attrs = metalsmith._metadata
    @attrs.content = [m('h1', m.trust title), m.trust(file.html)]
    @

  view: (ctrl, file, metalsmith) ->
    [
      m Base, ctrl.attrs
      m LaicosIcons
    ]
