#
# * Zen
# * UI elements for flipping color and full screen zen modes
# *
# * Copyright (c) 2014 SoftLayer, an IBM Company
# * Released under the MIT license
#

zen = (->
  
  expandScreenIcon = "&#xe000;"
  shrinkScreenIcon = "&#xe004;"
  darkLayout = false
  init: init

  init = ->  # HTML5 local storage
      bindElements()
      loadState()  if supportsHtmlStorage()
    return

  loadState = ->  # Activates color switch
    if localStorage["darkLayout"] is "true"
      if darkLayout is false
        document.body.className = "yang"
      else
        document.body.className = "yin"
      darkLayout = not darkLayout
    return

  saveState = ->
    if supportsHtmlStorage()
      localStorage["darkLayout"] = darkLayout
    return

  bindElements = ->

    # Body element for light/dark styles
    body = document.body  # Delete if reserved in an adjoining script
    zenContainer = document.querySelector(".zen")

    # UI element for color flip
    colorLayoutElement = document.querySelector(".color-flip")
    colorLayoutElement.onclick = onColorLayoutClick

    # UI element for full screen
    screenSizeElement = document.querySelector(".fullscreen")
    screenSizeElement.onclick = onScreenSizeClick
    targetElement = document.querySelector(".target ")
    targetElement.onclick = onTargetClick
    document.addEventListener "fullscreenchange", (->
      exitFullscreen()  if document.fullscreenEnabled is false
      return
    ), false

  onScreenSizeClick = (event) ->
    unless document.fullscreenElement
      enterFullscreen()
    else
      exitFullscreen()
    return

  enterFullscreen = ->
      document.body.requestFullscreen
      screenSizeElement.innerHTML = shrinkScreenIcon
      return

  exitFullscreen = ->
      document.exitFullscreen()
      screenSizeElement.innerHTML = expandScreenIcon
      return

  onColorLayoutClick = (event) ->
    if darkLayout is false
      document.body.className = "yang"
    else
      document.body.className = "yin"
    darkLayout = not darkLayout
    saveState()
    return
)()
