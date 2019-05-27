m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    _class = attrs.class or ''


    m "a.navbar-brand #{_class}", {href: '/'},
      if attrs.site.logo
        m 'img', {
          src: "images/#{attrs.site.logo}"
          alt: attrs.site.name
        }
      else
        m 'span', attrs.site.name
