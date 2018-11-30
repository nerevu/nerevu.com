m = require 'mithril'
Icon = require './icon'

module.exports = (vnode) ->
  view: (vnode) ->
    attrs = vnode.attrs

    m 'ul.inline-list.list-laicos',
      Object.entries(attrs.laicos).map ([key, item]) ->
        m "li.laicos-#{key}", m(Icon, Object.assign {id: key}, item)
