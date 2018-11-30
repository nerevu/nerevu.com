m = require 'mithril'
Burger = require './burger'
Brand = require './brand'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    navClass = if attrs.site.fixedHeader then 'fixed' else ''

    m 'nav#topnav[role="navigation"]', {class: navClass}, [
      m '#mobile-navbar.container.handheld', [
        m Brand, Object.assign {class: 'left'}, attrs
        m '.mobile-nav.right', m Burger
      ]

      m '#navbar.container.hidden-slow', [
        m Brand, Object.assign {class: 'non-handheld'}, attrs
        m 'ul.nav-list', [
          attrs.sections?.map (section) ->
            m 'li', m 'a',
              class: if attrs.section.id is section.id then 'active' else ''
              href: section.href or "/#{section.id}"
            ,
              section.title
        ]
      ]
    ]
