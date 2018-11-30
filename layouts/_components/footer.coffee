m = require 'mithril'
Social = require './social'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    year = (new Date()).getFullYear()

    m 'section#footer', m '.container', [
      m 'p', [
        m.trust "&copy; #{year}"
        m.trust '&nbsp'
        m 'a', {href: attrs.site.url}, "#{attrs.site.name}"
        m.trust '.&nbsp'
        'All rights reserved.'
      ]

      m 'ul.inline-list',
        Object.entries(attrs.footer).map ([key, value]) ->
          m 'li',
            m 'a', {href: "/#{key}"}, value

      m Social, attrs
    ]
