m = require('mithril')

module.exports =
  controller: (file, metalsmith, callback) -> callback()
  view: (controller, file, metalsmith) ->
    [
      m 'h1', file.title
      m 'main', file.contents.toString()
    ]
