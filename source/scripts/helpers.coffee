remove = (orginal, toRemove) ->
  regex = "(^|\\b)#{toRemove.split(' ').join('|')}(\\b|$)"
  orginal.replace(new RegExp(regex, 'gi'), ' ')

module.exports =
  addClass: (el, className) ->
    if el.classList and not el.classList.contains(className)
      el.classList.add(className)
    else if not ~el.className.indexOf(className)
      el.className += " #{className}"

  removeClass: (el, className) ->
    if el.classList and el.classList.contains(className)
      el.classList.remove className
    else if ~el.className.indexOf(className)
      el.className = remove el.className, className

  toggleClass: (el, className) ->
    if el.classList
      el.classList.toggle(className)
    else if el.className is className
      el.className = remove el.className, className
    else if el.className
      el.className += " #{className}"
    else
      el.className = className

  hasClass: (el, className) ->
    if el.classList
      el.classList.contains(className)
    else
      el.className is className

  # Create a new object from an array of [key, value] pairs.
  toObject: (pairs) ->
    new ->
      @[key] = value for [key, value] in pairs
      @
