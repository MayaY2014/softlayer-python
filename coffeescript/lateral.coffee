#
# * Lateral
# * On-page scrollability and sliding maneuverability
# *
# * Copyright (c) 2014 SoftLayer, an IBM Company
# * Released under the MIT license
#

# Enables the sliding maneuverability for the sidebar

menuToggle = document.getElementById("menu-toggle")
menuActive = document.getElementById("menu")
pageTOC = document.getElementById("toc")
body = document.body

menuToggle.onclick = ->
  unclassy.toggle body, "pushed-right"
  unclassy.toggle menuActive, "opened"
  unclassy.toggle menuToggle, "fixed"
  unclassy.toggle pageTOC, "hidden"
  return


# Shows and hides the "back to top" scroll button

pageOffset = document.documentElement.scrollTop or document.body.scrollTop

scrollTo = (element, to, duration) ->
  start = element.scrollTop
  change = to - start
  currentTime = 0
  increment = 20
  animateScroll = ->
    currentTime += increment
    val = Math.easeInOutQuad(currentTime, start, change, duration)
    element.scrollTop = val
    setTimeout animateScroll, increment  if currentTime < duration
    return

  animateScroll()
  return

window.onscroll = ->
  if pageYOffset >= 200
    document.getElementById("scroll-up").style.visibility = "visible"
  else
    document.getElementById("scroll-up").style.visibility = "hidden"
    return
  document.getElementById("scroll-up").onclick = ->
    scrollTo document.body, 0, 0
    return
  return

Math.easeInOutQuad = (t, b, c, d) ->
  t /= d / 2
  return c / 2 * t * t + b  if t < 1
  t--
  -c / 2 * (t * (t - 2) - 1) + b
