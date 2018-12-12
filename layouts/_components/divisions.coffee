m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    companySize = attrs.items.length
    _class = switch companySize
      when 1 then 'one'
      when 2 then 'half'
      when 3 then 'third'
      when not companySize % 3 then 'third stack'
      else 'half stack'

    m '.component',
      attrs.items.map (item) ->
        m "figure.#{_class}", [
          m 'a', {href: item.href},
            m 'img.logo', {
              src: item.logo
              alt: item.name
              title: "Visit the #{item.name} website"
              width: '100%'
            }
          m 'figcaption', item.content
        ]
