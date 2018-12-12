m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs

    [
      m 'address.vcard component fourth', [
        m '.org', attrs.name
        m '.adr', [
          attrs.address.lines.map (line) ->
            m '.street-address', line

          m 'span.locality', "#{attrs.address.city}, "
          m 'span.region', "#{attrs.address.state} "
          m 'span.postal-code', attrs.address.zip
          m 'br'
          m 'span.country-name hidden', attrs.address.country
        ]

        m 'br'
        m 'a.email', {href: "mailto:#{attrs.email}"}, attrs.email
        m 'br'
        m 'a.tel', {href: "tel:#{attrs.phone}"}, attrs.phone
      ]

      m 'iframe[allowfullscreen].three-fourths', {
        src: "//www.google.com/maps/embed/v1/place?q=#{attrs.place}&key=#{attrs.key}"
      }
    ]
