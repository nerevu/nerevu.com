m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    teamSize = attrs.items.length

    _class = switch teamSize
      when 1 then 'one'
      when 2 then 'half'
      when not teamSize % 3 then 'third'
      else 'half'

    m '.component',
      attrs.items.map (item) ->
        m ".person stack #{_class}", [
          m 'a', {href: "//www.linkedin.com/in/#{item.linkedin}"},
            m 'img.left headshot', {
              src: item.photo
              alt: item.name
              title: "#{item.name} on LinkedIn"
            }
          m '.bio', [
            m 'p.name', m 'bold', item.name
            m 'p.position muted', item.position
            m 'p', item.content
          ]
        ]
