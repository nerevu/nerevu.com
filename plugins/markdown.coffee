path = require 'path'
# hljs = require '../node_modules/highlight.js'
marked = require '../node_modules/marked'
_ = require '../node_modules/lodash'

renderer = new marked.Renderer()

slug = (text) ->
  text = text?.trim() or ''
  text.replace(/\W+/g, '-').replace(/[\-]+/g, '-')
  text

# add an embedded anchor tag like on GitHub
renderer.heading = (text, level) ->
  slugged = slug text
  "<h#{level} class='heading'>#{text}<a title='#{text}' id='#{slugged}' class='anchor' href='##{slugged}' aria-hidden='true'></a></h#{level}>"

DEFAULTS =
  renderer: renderer
  smartypants: true
  # highlight: (code, lang) -> hljs.highlight(lang, code).value

markdown = (file) -> /\.md|\.markdown/.test(path.extname(file))

module.exports = (options) ->
  options = options or {}
  # opts = _.defaults options, DEFAULTS
  opts = {}
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
