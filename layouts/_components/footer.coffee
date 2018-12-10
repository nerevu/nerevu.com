m = require 'mithril'
Laicos = require './laicos'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    year = (new Date()).getFullYear()

    m 'footer#footer',
      m '.container', [
        m 'span.copy center centered', [
          m.trust "&copy; #{year}"
          m.trust '&nbsp'
          m 'a', {href: attrs.site.url}, "#{attrs.site.name}"
          m.trust '.&nbsp'
          'All rights reserved.'
        ]

        m Laicos, attrs
      ]
