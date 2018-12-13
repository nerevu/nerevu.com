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
    logo: 'nerevu-logo.png'

  paths:
    images: 'images'
    css: 'styles'
    js: 'scripts'
    source: 'source'
    dest: 'public'
    # rss: '/feed.xml'
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
    # rss:
    #   href: '//feeds.feedburner.com/nerevu'
    #   title: 'Nerevu RSS feed'
    #   left: 56
    #   top: 56
    #   width: 400
    #   height: 400
    envelope:
      href: 'mailto:info@nerevu.com'
      user: 'info@nerevu.com'
      title: 'email Nerevu'
      left: 0
      top: 0
      width: 490
      height: 490
    # angellist:
    #   left: -6
    #   top: -7
    #   width: 67
    #   height: 67

  sections: [
    {
      title: 'Divisions'
      id: 'divisions'
      items: [
        {
          id: 'nerevu-analytics'
          name: 'Nerevu Analytics'
          logo: 'images/nerevu-analytics-logo.png'
          href: '//analytics.nerevu.com'
          content: 'Nerevu Analytics is a data driven advisory and development firm that helps organizations reach and retain their ideal customers.'
        }, {
          id: 'nerevu-labs'
          name: 'Nerevu Labs'
          logo: 'images/nerevu-labs-logo.png'
          href: '//labs.nerevu.com'
          content: 'Nerevu Labs develops single page app (SPA) prototypes and minimum viable products (MVPs) for startups and internal Nerevu projects.'
        }
      ]
    }
    {
      title: 'Team'
      id: 'team'
      items: [
        {
          name: 'Reuben Cummings'
          photo: 'images/reuben.jpg'
          position: 'Founder and President'
          linkedin: 'reubano'
          content: 'Reuben is a data guru who is obsessed with transforming data and extracting meaningful information from it. A Peoria native, open source contributor, and international speaker, Reuben helps organizations turn their data into actionable insights.'
        }, {
          name: 'Kevin Evans'
          photo: 'images/kevin.jpg'
          position: 'Advisor'
          linkedin: 'kevin-evans-3232146b'
          content: 'Kevin is Director of the Illinois Small Business Development Center (SBDC) and has over 25 years experience in small business and entrepreneurship.'
        }, {
          name: 'Andy Fograscher'
          photo: 'images/andy.jpg'
          position: 'Advisor'
          linkedin: 'andyfograscher'
          content: 'Andy is President of Stellar Systems, and has over 30 years experience in accounting and information technology.'
        }, {
          name: 'Lee Maki'
          photo: 'images/lee.jpg'
          position: 'Advisor'
          linkedin: 'lee-maki-606026118'
          content: 'Lee Maki has over 30 years experience in ???'
        }
      ]
    }
    {
      title: 'Contact'
      id: 'contact'
      name: 'Nerevu Group'
      email: 'info@nerevu.com'
      photoExt: 'png'
      photoName: 'images/map'
      address:
        lines: ['The Nest Coworking', '820 SW Adams St.', 'Suite C']
        city: 'Peoria'
        state: 'IL'
        country: 'USA'
        zip: 61602
      phone: '+1 (234) 738-2266'
      place: 'nest%20coworking%20peoria'
    }
  ]
