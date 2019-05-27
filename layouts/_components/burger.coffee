m = require 'mithril'

module.exports =
  view: (vnode) ->
    m 'button.hamburger.hamburger--squeeze', {
      type: 'button',
      'aria-label': 'Menu',
      'aria-controls': 'navigation'
    },
      m 'span.hamburger-box', m 'span.hamburger-inner'
