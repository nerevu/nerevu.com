m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs

    m 'section#header.inverse',
      m '.container center xl half-width non-handheld', attrs.content
      m '.container center big tablet', attrs.content
      m '.container center mobile non-tablet', attrs.content
