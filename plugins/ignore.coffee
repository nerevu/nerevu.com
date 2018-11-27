_ = require '../node_modules/lodash'
moment = require '../node_modules/moment-timezone'
multimatch = require '../node_modules/multimatch'
now = new Date()

module.exports = (patterns) ->
  values = patterns or ['!**/_*', '!**/_*/**', '!**/.DS_Store']
  patterns = _.concat ['**/*'], values

  (files, metalsmith, done) ->
    filenames = multimatch Object.keys(files), patterns

    for file, data of files
      if data.date and not data.event_date
        future = data.date >= now
      else
        future = false

      missing = file not in filenames

      if future or missing or data.draft or data.private or data.fork
        delete files[file]

    done()
