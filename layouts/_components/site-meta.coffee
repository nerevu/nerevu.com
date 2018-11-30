m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs

    if attrs.page?.description
      pageDesc = attrs.page.description
    else if attrs.page?.less
      pageDesc = attrs.page.less.toString()
    else
      pageDesc = attrs.site?.description

    [
      m 'meta', {charset: 'utf8'}
      m 'meta', {
        'http-equiv': 'content-type'
        content: 'text/html; charset=utf-8'
      }

      m 'meta', {'http-equiv': 'X-UA-Compatible', content: 'IE=edge, chrome=1'}
      m 'meta', {name: 'author', content: attrs.site.name}
      m 'meta', {name: 'description', content: pageDesc}
      # m 'meta', {name: 'DC.date.issued', content: '2012-07-16T06:00-05:00'}
      # m 'meta', {name: 'date', content: '2012-07-16'}
      m 'meta', {
        name: 'viewport'
        content: 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
      }

      m 'meta', {name: 'format-detection', content: 'telephone=no'}
      m 'meta', {name: 'apple-mobile-web-app-capable', content: 'yes'}
      m 'meta', {
        name: 'apple-mobile-web-app-status-bar-style'
        content: 'black-translucent'
      }

      m 'link', {
        rel: 'shortcut icon'
        type: 'image/x-icon'
        href: 'favicon.ico'
      }

      m 'link', {
        rel: 'icon'
        type: 'image/svg+xml'
        href: 'icons/favicon.svg'
      }

      m 'link', {
        rel: 'mask-icon'
        href: 'icons/favicon.svg'
        color: 'white'
      }

      ['152', '144', '114', '72', '57'].map (size) ->
        sizes = "#{size}x#{size}"

        [
          m 'link', {
            rel: 'apple-touch-icon'
            sizes: sizes
            href: "icons/apple-touch-icon-#{size}.png"
          }

          m 'link', {
            rel: 'apple-touch-icon-precomposed'
            sizes: sizes
            href: "icons/apple-touch-icon-#{size}.png"
          }
        ]

      ['196', '160', '96', '32', '16'].map (size) ->
        sizes = "#{size}x#{size}"

        m 'link', {
          rel: 'icon'
          sizes: sizes
          type: 'image/png'
          href: "icons/favicon-#{size}.png"
        }

      if attrs.site?.url
        m 'link', {rel: 'canonical', href: attrs.site.url}
    ]
