mode = process.env.NODE_ENV
prod = mode is 'production'

URLS =
  netlify: 'https://www.nerevu.com'
  local: 'http://localhost:3000'

tags = [
  'programming'
  'data'
  'finance'
  'technology'
  'python'
  'clojure'
  'clojurescript'
  'javascript'
  'investing'
  'asset allocation'
  'portfolio performance'
  'risk'
  'web application development'
  'API'
  'flask'
  'node'
  'coffeescript'
  'entrepreneurship'
]

module.exports =
  mode: mode
  prod: prod
  serve: process.env.SERVE
  site:
    name: 'Nerevu Group'
    title: 'Nerevu Group, LLC'
    url: URLS[process.env.SITE]
    version: '0.1.0'
    description: "Nerevu Group is a data driven holding company with operations in the software, technology, financial services, real estate, and investment sectors."
    tags: tags
    keywords: tags.join ', '

  footer:
    privacy: 'Privacy'
    terms: 'Terms'

  paths:
    images: 'images'
    css: 'styles'
    js: 'scripts'
    source: 'source'
    dest: 'public'
    rss: '/feed.xml'
    optimize: '//res.cloudinary.com/nerevu/image/fetch/f_auto,q_auto'

  laicos:
    facebook:
      href: '//www.facebook.com/nerevu'
      user: 'nerevu'
      userID: 300084520193307
      title: 'Nerevu on Facebook'
    github:
      href: '//github.com/nerevu'
      user: 'nerevu'
      title: 'Nerevu on GitHub'
      left: -5
      top: -6
      width: 42
      height: 42
    twitter:
      href: '//twitter.com/nerevu'
      user: 'nerevu'
      title: 'Nerevu on Twitter'
      left: 3
      top: 3
      width: 26
      height: 26
    linkedin:
      href: '//www.linkedin.com/company/nerevu'
      user: 'nerevu'
      title: 'Nerevu on LinkedIn'
      left: -7
      top: -5
      width: 40
      height: 40
    rss:
      href: '//feeds.feedburner.com/nerevu'
      title: 'Nerevu RSS feed'
      left: 56
      top: 56
      width: 400
      height: 400
    envelope:
      href: 'mailto:info@nerevu.com'
      user: 'info@nerevu.com'
      title: 'email Nerevu'
      left: 0
      top: 0
      width: 490
      height: 490
