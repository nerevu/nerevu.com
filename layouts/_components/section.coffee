m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    Component = require "./#{attrs.id}"

    m "section##{attrs.id}", {
      class: if attrs.inverse then 'inverse' else ''
    },
      m '.container', [
        m 'h2.center', attrs.title
        m Component, attrs
      ]
