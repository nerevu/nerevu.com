m = require 'mithril'
Laicos = require './laicos'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    year = (new Date()).getFullYear()

    m 'footer#footer',
      m '.container', [
        m 'span.copy center centered non-mobile', [
          "© #{year} "
          m 'a', {href: attrs.site.url}, "#{attrs.site.title}"
          ' All rights reserved.'
        ]

        m '.copy center centered mobile', [
          m 'span', [
            "© #{year} "
            m 'a', {href: attrs.site.url}, "#{attrs.site.title}"
          ]
          m 'br'
          m 'span', 'All rights reserved.'
        ]

        m Laicos, attrs
      ]
