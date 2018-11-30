m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs

    options = switch attrs.iconType
      when 'io' then {el: 'span', class: "oi oi-#{attrs.id}"}
      when 'fa' then {el: 'span', class: "fa fa-#{attrs.id}"}
      else {el: 'span', class: "text-primary icon-#{attrs.id}"}

    if attrs.size and attrs.iconType
      options.class += " #{attrs.iconType}-#{attrs.size}"

    m 'a', {href: attrs.href}, m "#{options.el}[aria-hidden='true']",
      class: options.class
      title: attrs.title
