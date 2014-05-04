#
# * Github
# * Fetches payloads and showcases contributors, stargazers, watchers, and tags
# *
# * Copyright (c) 2014 SoftLayer, an IBM Company
# * Released under the MIT license
#

# Contributors (total contributors)
# ------------------------------

$.getJSON "https://api.github.com/repos/softlayer/softlayer-python/contributors?callback=?", (result) ->
  numContributors = result.data
  $ ->
    $("#github-contributors").text numContributors.length
    return
  return

# Stargazers + Watchers (total stargazers and watchers)
# ------------------------------

$.ajax
  url: "https://api.github.com/repos/softlayer/softlayer-python?callback?"
  dataType: "jsonp"
  success: (json) ->
    numStargazers = json.data  # Stargazers
    $("#github-stargazers").text numStargazers.stargazers_count

    numWatchers = json.data  # Watchers
    $("#github-watchers").text numWatchers.subscribers_count
    return

# Tags (number for last release/tag)
# ------------------------------

$.ajax
  url: "https://api.github.com/repos/softlayer/softlayer-python/tags?callback?"
  dataType: "jsonp"
  success: (json) ->
    lastTag = json.data[0]
    $("#github-version").text lastTag.name
    return
