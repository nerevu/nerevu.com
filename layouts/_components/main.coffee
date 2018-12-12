m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs

    m 'section#header.inverse',
      m '.container center xl half-width', attrs.content
