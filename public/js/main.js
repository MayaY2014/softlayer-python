/*!
 * 
 * SoftLayer CLI
 * Boilerplate version 0.3.0, Built on 05-02-2014
 * Copyright (c) 2014 SoftLayer, an IBM Company. All rights reserved.
 * Code and documentation licensed under MIT.
 * 
 */

(function() {
  (function(window) {
    var addClass, classReg, hasClass, removeClass, toggleClass, unclassy;
    classReg = function(className) {
      return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
    };
    toggleClass = function(elem, c) {
      var fn;
      fn = (hasClass(elem, c) ? removeClass : addClass);
      fn(elem, c);
    };
    "use strict";
    hasClass = void 0;
    addClass = void 0;
    removeClass = void 0;
    if ("classList" in document.documentElement) {
      hasClass = function(elem, c) {
        return elem.classList.contains(c);
      };
      addClass = function(elem, c) {
        elem.classList.add(c);
      };
      removeClass = function(elem, c) {
        elem.classList.remove(c);
      };
    } else {
      hasClass = function(elem, c) {
        return classReg(c).test(elem.className);
      };
      addClass = function(elem, c) {
        if (!hasClass(elem, c)) {
          elem.className = elem.className + " " + c;
        }
      };
      removeClass = function(elem, c) {
        elem.className = elem.className.replace(classReg(c), " ");
      };
    }
    unclassy = {
      hasClass: hasClass,
      addClass: addClass,
      removeClass: removeClass,
      toggleClass: toggleClass,
      has: hasClass,
      add: addClass,
      remove: removeClass,
      toggle: toggleClass
    };
    if (typeof define === "function" && define.amd) {
      define(unclassy);
    } else if (typeof exports === "object") {
      module.exports = unclassy;
    } else {
      window.unclassy = unclassy;
    }
  })(window);

}).call(this);

(function() {
  var body, menuActive, menuToggle, pageOffset, pageTOC, scrollTo;

  menuToggle = document.getElementById("menu-toggle");

  menuActive = document.getElementById("menu");

  pageTOC = document.getElementById("toc");

  body = document.body;

  menuToggle.onclick = function() {
    unclassy.toggle(body, "pushed-right");
    unclassy.toggle(menuActive, "opened");
    unclassy.toggle(menuToggle, "fixed");
    unclassy.toggle(pageTOC, "hidden");
  };

  pageOffset = document.documentElement.scrollTop || document.body.scrollTop;

  scrollTo = function(element, to, duration) {
    var animateScroll, change, currentTime, increment, start;
    start = element.scrollTop;
    change = to - start;
    currentTime = 0;
    increment = 20;
    animateScroll = function() {
      var val;
      currentTime += increment;
      val = Math.easeInOutQuad(currentTime, start, change, duration);
      element.scrollTop = val;
      if (currentTime < duration) {
        setTimeout(animateScroll, increment);
      }
    };
    animateScroll();
  };

  window.onscroll = function() {
    if (pageYOffset >= 200) {
      document.getElementById("scroll-up").style.visibility = "visible";
    } else {
      document.getElementById("scroll-up").style.visibility = "hidden";
      return;
    }
    document.getElementById("scroll-up").onclick = function() {
      scrollTo(document.body, 0, 0);
    };
  };

  Math.easeInOutQuad = function(t, b, c, d) {
    t /= d / 2;
    if (t < 1) {
      return c / 2 * t * t + b;
    }
    t--;
    return -c / 2 * (t * (t - 2) - 1) + b;
  };

}).call(this);

(function() {
  (function($) {
    $.fn.tocify = function(options) {
      var defaults, get_level, headers, highest_level, html, level, output, settings, this_level;
      defaults = {
        showSpeed: "slow"
      };
      settings = $.extend(defaults, options);
      headers = $("h1").filter(function() {
        return this.id;
      });
      output = $(this);
      if (!headers.length || headers.length < 3 || !output.length) {
        return;
      }
      get_level = function(ele) {
        return parseInt(ele.nodeName.replace("H", ""), 10);
      };
      highest_level = headers.map(function(_, ele) {
        return get_level(ele);
      }).get().sort()[0];
      level = get_level(headers[0]);
      this_level = void 0;
      html = "";
      headers.on("click", function() {
        window.location.hash = this.id;
      }).addClass("clickable-header").each(function(_, header) {
        this_level = get_level(header);
        if (this_level === highest_level) {
          $(header).addClass("top-level-header");
        }
        if (this_level === level) {
          html += "<li><a href='#" + header.id + "'>" + header.innerHTML + "</a>";
        }
        level = this_level;
      });
      if (0 !== settings.showSpeed) {
        output.hide().html(html).show(settings.showSpeed);
      } else {
        output.html(html);
      }
    };
  })(jQuery);

}).call(this);

(function() {
  $.getJSON("https://api.github.com/repos/softlayer/softlayer-python/contributors?callback=?", function(result) {
    var numContributors;
    numContributors = result.data;
    $(function() {
      $("#github-contributors").text(numContributors.length);
    });
  });

  $.ajax({
    url: "https://api.github.com/repos/softlayer/softlayer-python?callback?",
    dataType: "jsonp",
    success: function(json) {
      var numStargazers, numWatchers;
      numStargazers = json.data;
      $("#github-stargazers").text(numStargazers.stargazers_count);
      numWatchers = json.data;
      $("#github-watchers").text(numWatchers.subscribers_count);
    }
  });

  $.ajax({
    url: "https://api.github.com/repos/softlayer/softlayer-python/tags?callback?",
    dataType: "jsonp",
    success: function(json) {
      var lastTag;
      lastTag = json.data[0];
      $("#github-version").text(lastTag.name);
    }
  });

}).call(this);

(function() {
  (function($) {
    var addRepo, addRepos, repoDescription, repoDescriptions, repoUrl, repoUrls;
    repoUrl = function(repo) {
      return repoUrls[repo.name] || repo.html_url;
    };
    repoDescription = function(repo) {
      return repoDescriptions[repo.name] || repo.description;
    };
    addRepo = function(repo) {
      var $item, $link;
      $item = $("<li>").addClass("repo name " + (repo.language || "").toLowerCase());
      $link = $("<a>").attr("href", repoUrl(repo)).attr("target", "_blank").appendTo($item);
      $link.append($("<h2>").text(repo.name));
      $link.append($("<p>").text(repoDescription(repo)));
      $link.append($("<h4>").text(repo.language));
      $link.append($("<h5>").text(repo.watchers));
      $link.append($("<h6>").text(repo.forks));
      $item.appendTo("#repos");
    };
    addRepos = function(repos, page) {
      var uri;
      repos = repos || [];
      page = page || 1;
      uri = "https://api.github.com/orgs/softlayer/repos?callback=?" + "&per_page=50" + "&page=" + page;
      return $.getJSON(uri, function(result) {
        if (result.data && result.data.length > 0) {
          repos = repos.concat(result.data);
          return addRepos(repos, page + 1);
        } else {
          return $(function() {
            $.each(repos, function(i, repo) {
              var createdDelta, pushDelta, weekHalfLife, weightForPush, weightForWatchers;
              repo.pushed_at = new Date(repo.pushed_at);
              weekHalfLife = 1.146 * Math.pow(10, -9);
              pushDelta = "new Date" - Date.parse(repo.pushed_at);
              createdDelta = "new Date" - Date.parse(repo.created_at);
              weightForPush = 1;
              weightForWatchers = 1.314 * Math.pow(10, 7);
              repo.hotness = weightForPush * Math.pow(Math.E, -1 * weekHalfLife * pushDelta);
              return repo.hotness += weightForWatchers * repo.watchers / createdDelta;
            });
            repos.sort(function(a, b) {
              if (a.hotness < b.hotness) {
                return 1;
              }
              if (b.hotness < a.hotness) {
                return -1;
              }
            });
            $.each(repos, function(i, repo) {
              return addRepo(repo);
            });
            return repos.sort(function(a, b) {
              if (a.pushed_at < b.pushed_at) {
                return 1;
              }
              if (b.pushed_at < a.pushed_at) {
                return -1;
              }
            });
          });
        }
      });
    };
    repoUrls = {
      "": ""
    };
    repoDescriptions = {
      "": ""
    };
    return addRepos();
  })(jQuery);

}).call(this);

(function() {
  var $body, navHeight;

  +(function($) {
    var ScrollSpy, old;
    ScrollSpy = function(element, options) {
      var href, process;
      process = $.proxy(this.process, this);
      this.$element = ($(element).is("body") ? $(window) : $(element));
      this.$body = $("body");
      this.$scrollElement = this.$element.on("scroll.scrollspy", process);
      this.options = $.extend({}, ScrollSpy.DEFAULTS, options);
      this.selector = (this.options.target || ((href = $(element).attr("href")) && href.replace(/.*(?=#[^\s]+$)/, "")) || "") + " .nav li > a";
      this.offsets = $([]);
      this.targets = $([]);
      this.activeTarget = null;
      this.refresh();
      this.process();
    };
    "use strict";
    ScrollSpy.DEFAULTS = {
      offset: 10
    };
    ScrollSpy.prototype.refresh = function() {
      var offsetMethod, self;
      offsetMethod = (this.$element[0] === window ? "offset" : "position");
      this.offsets = $([]);
      this.targets = $([]);
      self = this;
      this.$body.find(this.selector).map(function() {
        var $el, $href, href;
        $el = $(this);
        href = $el.data("target") || $el.attr("href");
        $href = /^#./.test(href) && $(href);
        return ($href && $href.length && $href.is(":visible") && [[$href[offsetMethod]().top + (!$.isWindow(self.$scrollElement.get(0)) && self.$scrollElement.scrollTop()), href]]) || null;
      }).sort(function(a, b) {
        return a[0] - b[0];
      }).each(function() {
        self.offsets.push(this[0]);
        self.targets.push(this[1]);
      });
    };
    ScrollSpy.prototype.process = function() {
      var activeTarget, i, maxScroll, offsets, scrollHeight, scrollTop, targets;
      scrollTop = this.$scrollElement.scrollTop() + this.options.offset;
      scrollHeight = this.$scrollElement[0].scrollHeight || Math.max(this.$body[0].scrollHeight, document.documentElement.scrollHeight);
      maxScroll = scrollHeight - this.$scrollElement.height();
      offsets = this.offsets;
      targets = this.targets;
      activeTarget = this.activeTarget;
      if (scrollTop >= maxScroll) {
        return activeTarget !== (i = targets.last()[0]) && this.activate(i);
      }
      if (activeTarget && scrollTop <= offsets[0]) {
        return activeTarget !== (i = targets[0]) && this.activate(i);
      }
      i = offsets.length;
      while (i--) {
        activeTarget !== targets[i] && scrollTop >= offsets[i] && (!offsets[i + 1] || scrollTop <= offsets[i + 1]) && this.activate(targets[i]);
      }
    };
    ScrollSpy.prototype.activate = function(target) {
      var active, selector;
      this.activeTarget = target;
      $(this.selector).parentsUntil(this.options.target, ".active").removeClass("active");
      selector = this.selector + "[data-target=\"" + target + "\"]," + this.selector + "[href=\"" + target + "\"]";
      active = $(selector).parents("li").addClass("active");
      if (active.parent(".dropdown-menu").length) {
        active = active.closest("li.dropdown").addClass("active");
      }
      active.trigger("activate.scrollspy");
    };
    old = $.fn.scrollspy;
    $.fn.scrollspy = function(option) {
      return this.each(function() {
        var $this, data, options;
        $this = $(this);
        data = $this.data("scrollspy");
        options = typeof option === "object" && option;
        if (!data) {
          $this.data("scrollspy", (data = new ScrollSpy(this, options)));
        }
        if (typeof option === "string") {
          data[option]();
        }
      });
    };
    $.fn.scrollspy.Constructor = ScrollSpy;
    $.fn.scrollspy.noConflict = function() {
      $.fn.scrollspy = old;
      return this;
    };
    $(window).on("load.scrollspy.data-api", function() {
      $("[data-spy=\"scroll\"]").each(function() {
        var $spy;
        $spy = $(this);
        $spy.scrollspy($spy.data());
      });
    });
  });

  jQuery;

  +(function($) {
    "use strict";
    var affix, old;
    affix = function(element, options) {
      this.options = $.extend({}, affix.DEFAULTS, options);
      this.$window = $(window).on("scroll.affix.data-api", $.proxy(this.checkPosition, this)).on("click.affix.data-api", $.proxy(this.checkPositionWithEventLoop, this));
      this.$element = $(element);
      this.affixed = this.unpin = this.pinnedOffset = null;
      this.checkPosition();
    };
    affix.RESET = "affix affix-top affix-bottom";
    affix.DEFAULTS = {
      offset: 0
    };
    affix.prototype.getPinnedOffset = function() {
      var position, result, scrollTop;
      if (this.pinnedOffset) {
        return this.pinnedOffset;
      }
      this.$element.removeClass(affix.RESET).addClass("affix");
      scrollTop = this.$window.scrollTop();
      position = this.$element.offset();
      result = (this.pinnedOffset = position.top - scrollTop);
      return result;
    };
    affix.prototype.checkPositionWithEventLoop = function() {
      setTimeout($.proxy(this.checkPosition, this), 1);
    };
    affix.prototype.checkPosition = function() {
      var affixType, e, offset, offsetBottom, offsetTop, position, scrollHeight, scrollTop;
      if (!this.$element.is(":visible")) {
        return;
      }
      scrollHeight = $(document).height();
      scrollTop = this.$window.scrollTop();
      position = this.$element.offset();
      offset = this.options.offset;
      offsetTop = offset.top;
      offsetBottom = offset.bottom;
      if (typeof offset !== "object") {
        offsetBottom = offsetTop = offset;
      }
      if (typeof offsetTop === "function") {
        offsetTop = offset.top(this.$element);
      }
      if (typeof offsetBottom === "function") {
        offsetBottom = offset.bottom(this.$element);
      }
      affix = (this.unpin !== null && (scrollTop + this.unpin <= position.top) ? false : (offsetBottom !== null && (position.top + this.$element.height() >= scrollHeight - offsetBottom) ? "bottom" : (offsetTop !== null && (scrollTop <= offsetTop) ? "top" : false)));
      if (this.affixed === affix) {
        return;
      }
      if (this.unpin !== null) {
        this.$element.css("top", "");
      }
      affixType = "affix" + (affix ? "-" + affix : "");
      e = $.Event(affixType + ".affix");
      this.$element.trigger(e);
      if (e.isDefaultPrevented()) {
        return;
      }
      this.affixed = affix;
      this.unpin = (affix === "bottom" ? this.getPinnedOffset() : null);
      this.$element.removeClass(Affix.RESET).addClass(affixType).trigger($.Event(affixType.replace("affix", "affixed")));
      if (affix === "bottom") {
        this.$element.offset({
          top: position.top
        });
      }
    };
    old = $.fn.affix;
    $.fn.affix = function(option) {
      return this.each(function() {
        var $this, data, options;
        $this = $(this);
        data = $this.data("affix");
        options = typeof option === "object" && option;
        if (!data) {
          $this.data("affix", (data = new Affix(this, options)));
        }
        if (typeof option === "string") {
          data[option]();
        }
      });
    };
    $.fn.affix.Constructor = affix;
    $.fn.affix.noConflict = function() {
      $.fn.affix = old;
      return this;
    };
    $(window).on("load", function() {
      $("[data-spy=\"affix\"]").each(function() {
        var $spy, data;
        $spy = $(this);
        data = $spy.data();
        data.offset = data.offset || {};
        if (data.offsetBottom) {
          data.offset.bottom = data.offsetBottom;
        }
        if (data.offsetTop) {
          data.offset.top = data.offsetTop;
        }
        $spy.affix(data);
      });
    });
  });

  jQuery;

  $("#toc").affix({
    offset: {
      top: 235
    }
  });

  $body = $(document.body);

  navHeight = $("#page-content").outerHeight(true) + 10;

  $body.scrollspy;

  ({
    target: "#tocify",
    offset: navHeight
  });

  $("a[href*=#]:not([href=#])").click(function() {
    var target;
    target = void 0;
    if (location.pathname.replace(/^\//, "") === this.pathname.replace(/^\//, "") && location.hostname === this.hostname) {
      target = $(this.hash);
      target = (target.length ? target : $("[name=" + this.hash.slice(1) + "]"));
      if (target.length) {
        $("html,body").animate({
          scrollTop: target.offset().top - 50
        }, 1000);
        return false;
      }
    }
  });

}).call(this);
