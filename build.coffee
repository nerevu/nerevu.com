path = require 'path'
helpers = require './helpers'

stamp = Date.now()

checkpoint = (name, start) ->
  end = Date.now()
  time = (end - start) / 1000
  console.log("#{name} +#{time}s")
  end

axis = require './node_modules/axis'
jeet = require './node_modules/jeet'
Metalsmith = require './node_modules/metalsmith'
rm = require './node_modules/rimraf'

end = checkpoint 'require base', stamp

fingerprint = require './node_modules/metalsmith-fingerprint-ignore'
htmlMinifier = require './node_modules/metalsmith-html-minifier'
beautify = require './node_modules/metalsmith-beautify'
mithril = require './node_modules/metalsmith-mithril'
msIf = require './node_modules/metalsmith-if'
uglify = require './node_modules/metalsmith-uglify'
linkcheck = require './node_modules/metalsmith-linkcheck'

end = checkpoint 'require metalsmith plugins', end

browserify = require './plugins/browserify'
cleanCSS = require './plugins/clean-css'
compress = require './plugins/compress'
ignore = require './plugins/ignore'
markdown = require './plugins/markdown'
preempt = require './plugins/preempt'
stylus = require './plugins/stylus'
time = require './plugins/time'
end = checkpoint 'require local plugins', end

config = require './config'
js = config.paths.js

end = checkpoint 'set config', end

_ = helpers._

Runner = require('./node_modules/metalsmith-start').Runner

app = new Metalsmith(__dirname)
  .use time plugin: 'start', start: end
  .source config.paths.source
  .destination config.paths.dest
  .metadata config
  .use time plugin: 'metadata'
  .use preempt()
  .use time plugin: 'preempt'
  .use ignore()
  .use time plugin: 'ignore'
  .use markdown()
  .use time plugin: 'markdown'
  .use stylus
    compress: false
    use: [axis(), jeet()]
  .use time plugin: 'stylus'
  .use browserify
    destFolder: js
    plugin: if config.prod then [] else ['watchify']
    debug: not config.prod
  .use time plugin: 'browserify'
  .use fingerprint pattern: ['**/*.css', '**/*.js']
  .use time plugin: 'fingerprint'
  .use mithril.layouts ext: '.coffee'
  .use time plugin: 'mithril'
  .use msIf not config.serve, linkcheck()
  .use time plugin: 'linkcheck'
  .use msIf config.prod, cleanCSS
    files: "#{config.paths.css}/main*.css"
    rename: false
    sourceMap: false
    cleanCSS: rebase: true
  .use msIf config.prod, time plugin: 'cleanCSS'
  .use msIf config.prod, uglify sourceMap: false, nameTemplate: '[name].[ext]'
  .use msIf config.prod, time plugin: 'uglify'
  .use msIf config.prod, htmlMinifier()
  .use msIf config.prod, time plugin: 'htmlMinifier'
  .use msIf not config.prod, beautify()
  .use msIf not config.prod, time plugin: 'beautify'
  .use msIf config.prod, compress overwrite: false
  .use msIf config.prod, time plugin: 'compress'

build = (clean) ->
  afterProcess = (err, files) ->
    if err
      console.log "process error: #{err.message}"
    else
      app.write files, (err) ->
        endTime = (Date.now() - stamp) / 1000

        if err
          console.log "write error: #{err.message} "
        else
          _.keys(files).length
          console.log "Successfully built #{_.keys(files).length} files"
        # for filename, data of _files
        #   console.log "built #{filename}"

        console.log "built site in #{endTime}s "

  if clean
    rm path.join(app.destination(), '*'), (err) ->
      if err
        console.log "rimraf error: #{err.message}"
      else
        app.process afterProcess
  else
    app.process afterProcess

if config.serve
  r = new Runner(app)
  r.start()
else
  build true
