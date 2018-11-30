m = require 'mithril'

module.exports =
  view: (vnode) ->
    attrs = vnode.attrs
    _pageTitle = attrs.page?.title or attrs.page?.name or attrs.site?.name
    pageTitle = if _pageTitle is 'home' then attrs.site?.title else _pageTitle
    pageURL = attrs.page?.path or attrs.site?.url

    if attrs.page?.description
      pageDesc = attrs.page.description
    else if attrs.page?.less
      pageDesc = attrs.page.less.toString()
    else
      pageDesc = attrs.site?.description

    pageImage = attrs.page?.image or 'images/logo.png'
    pageContentType = attrs.page?.contentType or 'article'
    author = attrs.page?.author

    [
      # https://moz.com/blog/meta-data-templates-123
      m 'meta', {name: 'robots', content: 'index,follow'}

      # Google data
      m 'meta', {itemprop: 'name', content: pageTitle}
      m 'meta', {itemprop: 'description', content: pageDesc}
      m 'meta', {itemprop: 'image', content: pageImage}
      m 'meta', {itemprop: 'url', content: pageURL}

      if attrs.laicos?.twitter
        twitter = attrs.laicos.twitter
        creator = author?.twitter?.user or twitter.user

        [
          # Twitter Card data
          m 'meta', {name: 'twitter:card', content: 'summary_large_image'}
          m 'meta', {name: 'twitter:card', content: 'summary'}
          m 'meta', {name: 'twitter:site', content: "@#{twitter.user}"}
          m 'meta', {name: 'twitter:title', content: pageTitle}
          m 'meta', {name: 'twitter:creator', content: "@#{creator}"}
          m 'meta', {name: 'twitter:description', content: pageDesc}
          # <-- Twitter Summary card images must be at least 120x120px -->
          m 'meta', {name: 'twitter:image', content: pageImage}
          # m 'meta', {name: 'twitter:image:src', content: pageImage}
          m 'meta', {name: 'twitter:url', content: pageURL}
        ]

      if attrs.laicos?.facebook
        facebook = attrs.laicos.facebook
        creator = author?.facebook?.userID or facebook.userID

        [
          # Open Graph data
          m 'meta', {property: 'article:author', content: creator}
          m 'meta', {property: 'og:title', content: pageTitle}
          m 'meta', {property: 'og:type', content: pageContentType}
          m 'meta', {property: 'og:url', content: pageURL}
          m 'meta', {property: 'og:site_name', content: attrs.site?.title}
          m 'meta', {property: 'og:image', content: pageImage}
          # m 'meta', {property: 'og:image:width', content: 500}
          # m 'meta', {property: 'og:image:height', content: 439}
          m 'meta', {property: 'og:description', content: pageDesc}
          m 'meta', {property: 'fb:admins', content: facebook.userID}
        ]
    ]
