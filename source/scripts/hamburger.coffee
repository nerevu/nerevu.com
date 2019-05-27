helpers = require './helpers'

DEF_HAMBURGER_SELECTOR = '.hamburger'
DEF_WRAPPER_ID = 'navbar'

module.exports = class Hamburger
  constructor: (options) ->
    @d = document
    @hamburgerSelector = options?.hamburgerSelector or DEF_HAMBURGER_SELECTOR
    @wrapperID = options?.wrapperID or DEF_WRAPPER_ID

  activate: =>
    @hamburger = @d.querySelector @hamburgerSelector
    @wrapper = @d.getElementById @wrapperID

    if @hamburger and @wrapper
      @hamburger.addEventListener 'click', @toggle
    else if @wrapper
      console.log "hamburger selector '#{@hamburgerSelector}' not found!"
    else if @hamburger
      console.log "wrapper ID '#{@wrapperID}' not found!"
    else
      message = "neither hamburger selector '#{@hamburgerSelector}'"
      message += " nor wrapper ID '#{@wrapperID}' found!"
      console.log message

  toggle: (e) =>
    e.preventDefault()
    e.stopPropagation()
    helpers.toggleClass @hamburger, 'is-active'
    helpers.toggleClass @wrapper, 'visible-slow'
    helpers.toggleClass @wrapper, 'hidden-slow'

  close: =>
    helpers.removeClass @hamburger, 'is-active'
    helpers.removeClass @wrapper, 'visible-slow'
    helpers.addClass @wrapper, 'hidden-slow'
