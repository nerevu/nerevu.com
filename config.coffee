mode = process.env.NODE_ENV
prod = mode is 'production'

URLS =
  netlify: 'https://analytics.nerevu.com'
  local: 'http://localhost:8080'
  api: if prod then 'blog-subs-api.herokuapp.com' else 'localhost:5000'

tags = [
  'programming', 'data', 'finance', 'technology',  'travel',
  'blog', 'python', 'clojure', 'clojurescript', 'javascript', 'mac', 'osx',
  'linux', 'investing', 'asset allocation', 'travel hacking',
  'portfolio performance', 'risk', 'web application development',
  'restful api', 'flask', 'node', 'coffeescript', 'entrepreneurship']

module.exports =
  mode: mode
  prod: prod
  serve: process.env.SERVE
  site:
    name: 'reubano'
    author: 'Reuben Cummings'
    email: 'reubano@gmail.com'
    title: 'Reuben on Data'
    subtitle: 'musings of a data whisperer'
    url: URLS[process.env.SITE]
    api: URLS.api
    version: '0.0.4'

    description: "I'm Reuben Cummings, an open source enthusiast and " +
      'Pythonista. I help software companies eliminate inefficiencies and ' +
      'identify how customers are using their products and services. When' +
      ' your data starts talking, I’m the one you want listening.'

    tags: tags
    keywords: tags.join ', '

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
      id: 300084520193307
    github:
      api_token: process.env.GITHUB_ACCOUNT_KEY
      path: '//github.com/nerevu'
      user: 'nerevu'
      title: 'GitHub'
    twitter:
      path: '//twitter.com/nerevu'
      api_token: process.env.TWITTER_ACCOUNT_KEY
      user: 'nerevu'
      title: 'Twitter'
    linkedin:
      path: '//www.linkedin.com/showcase/nerevu-analytics'
      title: 'LinkedIn'
    rss:
      path: '//feeds.feedburner.com/nerevu'
      title: 'RSS'
