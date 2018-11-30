m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    m 'section#content', m '.container', attrs.content
