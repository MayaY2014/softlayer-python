#
# * Scrollspy
# * Smooth scrolling and content pinning for the subnav
# *
# * Copyright (c) 2014 SoftLayer, an IBM Company
# * Released under the MIT license
#

("#sidebar").affix offset:
  top: 235

navHeight = (".navbar").outerHeight(true) + 10
body.scrollspy
  target: "#leftCol"
  offset: navHeight

("a[href*=#]:not([href=#])").click ->
  if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
    target = (@hash)
    target = (if target.length then target else ("[name=" + @hash.slice(1) + "]"))

    if target.length
      ("html,body").animate
        scrollTop: target.offset().top - 50, 1000
    false
