path = require 'path'

_ = require './node_modules/lodash'
moment = require './node_modules/moment-timezone'
marked = require './node_modules/marked'
multimatch = require './node_modules/multimatch'

config = require './config'

slugOpts = {lower: true}
now = new Date()

slug = (text, opts) ->
  text = text?.trim() or ''
  text.replace(/\W+/g, '-').replace(/[\-]+/g, '-')
  text

_getFeatured = (category, filterby) ->
  item = category.data[0]

  if item.featured?
    ranked = _.filter category.data, (item) -> item.featured
  else if item.views?
    ranked = _.sortBy category.data, (item) -> -item.views
  else if item.stargazers_count?
    ranked = _.sortBy category.data, (item) -> -item.stargazers_count
  else if item.comments?
    ranked = _.sortBy category.data, (item) -> -item.comments
  else
    ranked = _.sortBy category.data, (item) -> -item.date

  _.shuffle if filterby then _.filter(ranked[...10], filterby) else ranked[...6]

getFeatured = _.memoize _getFeatured

getHeadings = (items) ->
  names = _.map items, 'name'
  titles = _.map items, 'title'
  _.uniq _.filter _.flatten [names, titles]

filterByHeading = (items, headings) ->
  _.filter items, (item) -> (item.name or item.title) not in headings

_getRecent = (category, filterby) ->
  featured = getFeatured(category, filterby)
  headings = getHeadings featured
  items = filterByHeading category.data, headings
  filtered = if filterby then _.filter(items, filterby) else items
  _.sortBy filtered, (item) -> -item.updated

getRecent = _.memoize _getRecent

module.exports =
  min2read: (content, wpm=160) ->
    wordCnt = content.toString().split(' ').length
    Math.ceil wordCnt / wpm

  getRelated: (category, article) ->
    sorted = _.sortBy category.data, (item) ->
      -_.intersection(article.tags, item.tags).length

    sorted.filter (item) -> item.title isnt article.title

  getFeatured: getFeatured
  getRecent: getRecent

  upcoming: (data) ->
    filtered = data.filter (item) -> item.date >= now
    _.sortBy filtered, (item) -> item.date

  past: (data) -> data.filter (item) -> item.date < now
  slug: slug
  _: _
  moment: moment
  marked: marked
  multimatch: multimatch
