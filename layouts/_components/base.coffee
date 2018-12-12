m = require 'mithril'
SiteMeta = require './site-meta'
LaicosMeta = require './laicos-meta'
Navbar = require './navbar'
Main = require './main'
Section = require './section'
Footer = require './footer'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs

    [
      m '!doctype[html]'
      m 'html', {lang: attrs.site.language, prefix: 'og: http://ogp.me/ns#'}, [
        m 'head', [
          m SiteMeta, attrs
          m LaicosMeta, attrs
          m 'link', {
            rel: 'stylesheet'
            href: attrs.fingerprint["#{attrs.paths.css}/main.css"]
            type: 'text/css'
          }

          m 'link', {rel: 'author', href: 'humans.txt'}
        ]

        m 'body', [
          m '#container', [
            m Navbar, attrs
            m '#sectionList.parallax', [
              m Main, attrs
              attrs.sections.map (section, pos) ->
                m Section, Object.assign {inverse: pos % 2}, section
              m Footer, attrs
            ]
          ]

          m 'script[async]', {
            src: attrs.fingerprint["#{attrs.paths.js}/bundle.js"]
          }
        ]
      ]
    ]
