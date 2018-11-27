zlib = require 'zlib'
each = require('../node_modules/async').each
_ = require '../node_modules/lodash'
moment = require '../node_modules/moment-timezone'
multimatch = require '../node_modules/multimatch'

DEFAULTS =
  src: "**/*.+(html|css|js|json|xml|svg|txt)",
  gzip: level: 6
  overwrite: false

module.exports = (options) ->
  options = options or {}
  _.defaults options, DEFAULTS

  overwrite = options.overwrite

  (files, metalsmith, done) ->
    filesTbCompressed = multimatch Object.keys(files), options.src

    each filesTbCompressed, (file, callback) ->
      gzip = zlib.createGzip(options.gzip)
      data = files[file]
      compressedChunks = []

      gzip.on 'data', (chunk) -> compressedChunks.push(chunk)
      gzip.on 'error', (error) -> callback(error)
      gzip.on 'end', ->
        compressedContents = Buffer.concat(compressedChunks)

        if overwrite
          compressedFile = file
        else
          compressedFile = "#{file}.gz"
          files[compressedFile] = _.clone(data)

        files[compressedFile].contents = compressedContents
        callback()

      if data.contents
        gzip.write data.contents
      else
        console.log "#{file} has no contents"

      gzip.end()

    , done
