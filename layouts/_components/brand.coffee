m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs

    m 'a.navbar-brand custom', {href: '/'},
      if attrs.site.logo
        m 'img', {
          src: "images/#{attrs.site.logo}"
          alt: attrs.site.name
        }
      else
        m 'span', attrs.site.name
