path = require 'path'
helpers = require '../helpers'
marked = require '../node_modules/marked'

renderer = new marked.Renderer()

_ = helpers._
slug = helpers.slug

# add an embedded anchor tag like on GitHub
renderer.heading = (text, level) ->
  slugged = slug text
  "<h#{level} class='heading'>#{text}<a title='#{text}' id='#{slugged}' class='anchor' href='##{slugged}' aria-hidden='true'></a></h#{level}>"

DEFAULTS =
  renderer: renderer
  smartypants: true

markdown = (file) -> /\.md|\.markdown/.test(path.extname(file))

module.exports = (options) ->
  options = options or {}
  opts = _.defaults options, DEFAULTS
  keys = options.keys or []

  (files, metalsmith, done) ->
    for file, data of files
      if markdown(file)
        dir = path.dirname(file)
        htmlPath = "#{path.basename(file, path.extname(file))}.html"

        if dir isnt '.'
          htmlPath = "#{dir}/#{htmlPath}"

        if data.contents
          data.markdown = data.contents
          str = marked data.markdown.toString(), opts
          data.html = new Buffer(str)

        keys.forEach (key) -> data[key] = marked(data[key], opts)
        delete files[file]
        files[htmlPath] = data

    done()
