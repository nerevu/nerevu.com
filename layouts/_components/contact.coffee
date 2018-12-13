m = require 'mithril'

sizes = [
  {size: 'mobile', width: 640}
  {size: 'tablet', width: 1024}
  {size: 'laptop', width: 1280}
]

getSrcset = (options) ->
  srcsets = sizes.map (s) ->
    "#{options.photoName}-#{s.size}.#{options.photoExt} #{s.width}w"

  srcsets.join(', ')

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs

    [
      m 'address.vcard component fourth stack mobile-center', [
        m 'bold.org', attrs.name
        m '.adr', [
          attrs.address.lines.map (line) ->
            m '.street-address non-mobile', line

          m 'span.street-address mobile', attrs.address.lines.map (line, pos) ->
            "#{if pos then ' | ' else ''}#{line}"

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

      m 'a.three-fourths stack', {href: "//www.google.com/maps/place?q=#{attrs.place}"},
        m 'img.cover fit', {
          src: "#{attrs.photoName}.#{attrs.photoExt}"
          sizes: '(min-width: 640px) 67vw, 100vw'
          srcset: getSrcset attrs
          alt: "#{attrs.name} location"
          title: "#{attrs.name} location"
        }

    ]
