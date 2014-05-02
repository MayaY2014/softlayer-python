#
# * Scrollspy
# * Smooth scrolling and content pinning for the subnav
# * (includes CoffeeScript ports of Scrollspy and Affix from Bootstrap)
# *
# * Copyright (c) 2014 SoftLayer, an IBM Company
# * Released under the MIT license
#

# Enables smooth scrolling and content pinning for boilerplate's subnav

$(".subnav").affix offset:
  top: 235

$body = $(document.body)
navHeight = $("#page-content").outerHeight(true) + 10
$body.scrollspy
  target: ".tocify"
  offset: navHeight

# Scrolling sections

$("a[href*=#]:not([href=#])").click ->
  if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
    target = $(@hash)
    target = (if target.length then target else $("[name=" + @hash.slice(1) + "]"))
    if target.length
      $("html,body").animate
        scrollTop: target.offset().top - 50
      , 1000
      false

# ========================================================================
# * Bootstrap: scrollspy.js v3.1.1
# * http://getbootstrap.com/javascript/#scrollspy
# * ========================================================================
# * Copyright 2011-2014 Twitter, Inc.
# * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
# * ========================================================================

+($) ->

  # SCROLLSPY CLASS DEFINITION
  # ==========================
  ScrollSpy = (element, options) ->
    href = undefined
    process = $.proxy(@process, this)
    @$element = (if $(element).is("body") then $(window) else $(element))
    @$body = $("body")
    @$scrollElement = @$element.on("scroll.scrollspy", process)
    @options = $.extend({}, ScrollSpy.DEFAULTS, options)
    #strip for ie7
    @selector = (@options.target or ((href = $(element).attr("href")) and href.replace(/.*(?=#[^\s]+$)/, "")) or "") + " .nav li > a"
    @offsets = $([])
    @targets = $([])
    @activeTarget = null
    @refresh()
    @process()
    return
  "use strict"
  ScrollSpy.DEFAULTS = offset: 10
  ScrollSpy::refresh = ->
    offsetMethod = (if @$element[0] is window then "offset" else "position")
    @offsets = $([])
    @targets = $([])
    self = this
    @$body.find(@selector).map(->
      $el = $(this)
      href = $el.data("target") or $el.attr("href")
      $href = /^#./.test(href) and $(href)
      ($href and $href.length and $href.is(":visible") and [[
        $href[offsetMethod]().top + (not $.isWindow(self.$scrollElement.get(0)) and self.$scrollElement.scrollTop())
        href
      ]]) or null
    ).sort((a, b) ->
      a[0] - b[0]
    ).each ->
      self.offsets.push this[0]
      self.targets.push this[1]
      return

    return

  ScrollSpy::process = ->
    scrollTop = @$scrollElement.scrollTop() + @options.offset
    scrollHeight = @$scrollElement[0].scrollHeight or Math.max(@$body[0].scrollHeight, document.documentElement.scrollHeight)
    maxScroll = scrollHeight - @$scrollElement.height()
    offsets = @offsets
    targets = @targets
    activeTarget = @activeTarget
    i = undefined
    return activeTarget isnt (i = targets.last()[0]) and @activate(i)  if scrollTop >= maxScroll
    return activeTarget isnt (i = targets[0]) and @activate(i)  if activeTarget and scrollTop <= offsets[0]
    i = offsets.length
    while i--
      activeTarget isnt targets[i] and scrollTop >= offsets[i] and (not offsets[i + 1] or scrollTop <= offsets[i + 1]) and @activate(targets[i])
    return

  ScrollSpy::activate = (target) ->
    @activeTarget = target
    $(@selector).parentsUntil(@options.target, ".active").removeClass "active"
    selector = @selector + "[data-target=\"" + target + "\"]," + @selector + "[href=\"" + target + "\"]"
    active = $(selector).parents("li").addClass("active")
    active = active.closest("li.dropdown").addClass("active")  if active.parent(".dropdown-menu").length
    active.trigger "activate.bs.scrollspy"
    return


  # SCROLLSPY PLUGIN DEFINITION
  # ===========================
  old = $.fn.scrollspy
  $.fn.scrollspy = (option) ->
    @each ->
      $this = $(this)
      data = $this.data("scrollspy")
      options = typeof option is "object" and option
      $this.data "scrollspy", (data = new ScrollSpy(this, options))  unless data
      data[option]()  if typeof option is "string"
      return


  $.fn.scrollspy.Constructor = ScrollSpy

  # SCROLLSPY NO CONFLICT
  # =====================
  $.fn.scrollspy.noConflict = ->
    $.fn.scrollspy = old
    this


  # SCROLLSPY DATA-API
  # ==================
  $(window).on "load.scrollspy.data-api", ->
    $("[data-spy=\"scroll\"]").each ->
      $spy = $(this)
      $spy.scrollspy $spy.data()
      return

    return

  return
(jQuery)

# ========================================================================
# * Bootstrap: affix.js v3.1.1
# * http://getbootstrap.com/javascript/#affix
# * ========================================================================
# * Copyright 2011-2014 Twitter, Inc.
# * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
# * ========================================================================
+($) ->
  "use strict"

  # AFFIX CLASS DEFINITION
  # ======================
  Affix = (element, options) ->
    @options = $.extend({}, Affix.DEFAULTS, options)
    @$window = $(window).on("scroll.affix.data-api", $.proxy(@checkPosition, this)).on("click.affix.data-api", $.proxy(@checkPositionWithEventLoop, this))
    @$element = $(element)
    @affixed = @unpin = @pinnedOffset = null
    @checkPosition()
    return

  Affix.RESET = "affix affix-top affix-bottom"
  Affix.DEFAULTS = offset: 0
  Affix::getPinnedOffset = ->
    return @pinnedOffset  if @pinnedOffset
    @$element.removeClass(Affix.RESET).addClass "affix"
    scrollTop = @$window.scrollTop()
    position = @$element.offset()
    result = (@pinnedOffset = position.top - scrollTop)
    result

  Affix::checkPositionWithEventLoop = ->
    setTimeout $.proxy(@checkPosition, this), 1
    return

  Affix::checkPosition = ->
    return  unless @$element.is(":visible")
    scrollHeight = $(document).height()
    scrollTop = @$window.scrollTop()
    position = @$element.offset()
    offset = @options.offset
    offsetTop = offset.top
    offsetBottom = offset.bottom
    offsetBottom = offsetTop = offset  unless typeof offset is "object"
    offsetTop = offset.top(@$element)  if typeof offsetTop is "function"
    offsetBottom = offset.bottom(@$element)  if typeof offsetBottom is "function"
    affix = (if @unpin isnt null and (scrollTop + @unpin <= position.top) then false else (if offsetBottom isnt null and (position.top + @$element.height() >= scrollHeight - offsetBottom) then "bottom" else (if offsetTop isnt null and (scrollTop <= offsetTop) then "top" else false)))
    return  if @affixed is affix
    @$element.css "top", ""  if @unpin isnt null
    affixType = "affix" + ((if affix then "-" + affix else ""))
    e = $.Event(affixType + ".affix")
    @$element.trigger e
    return  if e.isDefaultPrevented()
    @affixed = affix
    @unpin = (if affix is "bottom" then @getPinnedOffset() else null)
    @$element.removeClass(Affix.RESET).addClass(affixType).trigger $.Event(affixType.replace("affix", "affixed"))
    @$element.offset top: position.top  if affix is "bottom"
    return


  # AFFIX PLUGIN DEFINITION
  # =======================
  old = $.fn.affix
  $.fn.affix = (option) ->
    @each ->
      $this = $(this)
      data = $this.data("affix")
      options = typeof option is "object" and option
      $this.data "affix", (data = new Affix(this, options))  unless data
      data[option]()  if typeof option is "string"
      return


  $.fn.affix.Constructor = Affix

  # AFFIX NO CONFLICT
  # =================
  $.fn.affix.noConflict = ->
    $.fn.affix = old
    this


  # AFFIX DATA-API
  # ==============
  $(window).on "load", ->
    $("[data-spy=\"affix\"]").each ->
      $spy = $(this)
      data = $spy.data()
      data.offset = data.offset or {}
      data.offset.bottom = data.offsetBottom  if data.offsetBottom
      data.offset.top = data.offsetTop  if data.offsetTop
      $spy.affix data
      return

    return

  return
(jQuery)
