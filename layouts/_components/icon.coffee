m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    left = attrs.left or 0
    top = attrs.top or 0
    width = attrs.width or 32
    height = attrs.height or 32

    m 'a.laicos-icon', {
      href: attrs.href
      target: '_blank'
      rel: 'noopener noreferrer'
      alt: attrs.alt or attrs.title
      title: attrs.title
    },
      m 'svg.laicos-icon', {
        preserveaspectratio: 'none'
        viewbox: "#{left} #{top} #{width} #{height}"
      },
        m "use[xlink:href='##{attrs.id}']"
