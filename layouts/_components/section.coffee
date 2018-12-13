m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    Component = require "./#{attrs.id}"

    m "section##{attrs.id}", {
      class: if attrs.inverse then 'inverse' else ''
    },
      m '.container', [
        m 'h2.center heading', [
          m 'a.anchor', {
            title: attrs.title
            href: attrs.href or "/##{attrs.id}"
            'aria-hidden': true
          }
          attrs.title
        ]
        m Component, attrs
      ]

