#
# * Unclassy
# * A library agnostic, extensible DOM utility for class helper functions
# *
# * Cloned from "classie.js" and "bonzo.js"
# * Copyright © 2014 David DeSandro ("classie.js"), Dustin Diaz ("bonzo.js"), Softlayer, an IBM Company
# * Released under the MIT license
#

# Usage
# 1. unclassy.has( elem, 'my-class' ) -> true/false
# 2. unclassy.add( elem, 'my-new-class' )
# 3. unclassy.remove( elem, 'my-unwanted-class' )
# 4. unclassy.toggle( elem, 'my-class' )

((window) ->

  # class helper functions from bonzo (https://github.com/ded/bonzo)
  classReg = (className) ->
    new RegExp("(^|\\s+)" + className + "(\\s+|$)")

  # classList support for class management
  toggleClass = (elem, c) ->
    fn = (if hasClass(elem, c) then removeClass else addClass)
    fn elem, c
    return
  "use strict"
  hasClass = undefined
  addClass = undefined
  removeClass = undefined
  if "classList" of document.documentElement
    hasClass = (elem, c) ->
      elem.classList.contains c

    addClass = (elem, c) ->
      elem.classList.add c
      return

    removeClass = (elem, c) ->
      elem.classList.remove c
      return
  else
    hasClass = (elem, c) ->
      classReg(c).test elem.className

    addClass = (elem, c) ->
      elem.className = elem.className + " " + c  unless hasClass(elem, c)
      return

    removeClass = (elem, c) ->
      elem.className = elem.className.replace(classReg(c), " ")
      return
  unclassy =

    # full names
    hasClass: hasClass
    addClass: addClass
    removeClass: removeClass
    toggleClass: toggleClass

    # short names
    has: hasClass
    add: addClass
    remove: removeClass
    toggle: toggleClass


  # transport
  if typeof define is "function" and define.amd

    # AMD
    define unclassy
  else if typeof exports is "object"

    # CommonJS
    module.exports = unclassy
  else

    # browser global
    window.unclassy = unclassy
  return
) window
