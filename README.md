## Work in Progress

Development is currently carving out this branch for use with GitHub Pages.


## Introduction

Our project page uses a content-first boilerplate for building web content with Markdown. It's designed ideally for spinning up Jekyll-powered static websites on GitHub.


### Initiatives

Our vision for this boilerplate derived from a number of key initiatives.

* Write content exclusively in Markdown
* Rely on fast load times
* Automate repetitive tasks
* Expect complete responsiveness without wrapping code in custom HTML selectors
* Have a table of contents built automatically on each page
* ~~Use one source file to serve configuration data to other components and pages~~
* ~~Generate your own configuration file instantly from the command line~~
* Deploy minified or unminified JavaScript and CSS in production
* Run the site locally on modern Windows OS platforms
* ~~Create new Markdown pages on-the-fly from the command line~~
* ~~Zen mode to hide reading distractions and an inverted canvas for those that prefer the Darkside~~ 


### Features and Delighters

* Free web hosting on GitHub with [Jekyll](http://jekyllrb.com "Jekyll")
* [Grunt](http://gruntjs.com "Grunt") automation for handling repetitive tasks
* Markdown-compatibility and rendering with [Redcarpet](http://github.com/vmg/redcarpet "Redcarpet")
* ~~Code highlighting with [Rouge](http://rouge.jayferd.us/demo "Rouge") using [Manni](http://richleland.github.io/pygments-css) pygments~~
* Code highlighting with [Pygments](http://pygments.org "Pygments") using [Manni](http://richleland.github.io/pygments-css)-styled pygments
* Base HTML5
* Responsive grid and MQs from [Bootstrap](http://twitter.github.io/bootstrap "Twitter Bootstrap")
* ~~[Modernizr](http://modernizr.com "Modernizr") polyfills for cross-browser support~~
* [html5shiv](http://en.wikipedia.org/wiki/HTML5_Shiv "html5shiv") enabling script for legacy IE compatibility
* [Font Awesome](http://fortawesome.github.io/Font-Awesome "Font Awesome") iconic font
* ~~[Designmodo Flat UI](http://designmodo.com/flat-free "Designmodo") icons~~
* [jQuery](http://jquery.com "jQuery")
* Pretty URLs
* Google's [Universal Analytics](http://www.google.com/analytics) snippet with the ability to [track page scrolls](https://github.com/h5bp/html5-boilerplate/blob/master/doc/extend.md#google-universal-analytics)
* [Noto Sans](http://www.google.com/fonts/specimen/Noto+Sans) font from Google Fonts
* [Normalize](http://necolas.github.com/normalize.css) for CSS normalizations and resets
* Scripts built with [CoffeeScript](http://coffeescript.org "CoffeeScript") and transpiled into JavaScript
* [LESS](http://lesscss.org "LESS") dynamic stylesheets for variables, mixins, nesting, and more
* Shopify's [Liquid](http://liquidmarkup.org "Liquid") templating language
* [Minimal-UI viewport](http://github.com/h5bp/html5-boilerplate/blob/master/doc/extend.md#web-apps) meta tag for iOS 7.1+
* ~~Improved HTML5 accessibility for screen readers~~


### Baked-in Automation

We're big proponents of the DRY (don't repeat yourself) principle. That's why automation became a distinct competency for this project. The more automation there is, the less repetitive work you have (and hopefully the less mistakes you make). 

Aside from [Grunt](http://gruntjs.com "Grunt"), we baked in a few automated tasks of our own.

* Create menu links automatically when new pages are added
* Dynamically build the subnav's table of contents
* Enable or disable Google Analytics
* Pull in statistical data from GitHub
* Load a fallback jQuery library if the bootstrapped CDN fails

---

## Prerequisites

Our boilerplate requires these minimum versions for Ruby, Python, and Node. Click the links below to get download and installation instructions for your OS.

__Windows users:__ Check out Yi Zeng's ["Setup Jekyll on Windows" article](http://yizeng.me/2013/05/10/setup-jekyll-on-windows "Setup Jekyll on Windows") before installing.

* [Ruby v1.9.3](http://www.ruby-lang.org/en/installation)
* [Python v2.7.5](http://www.python.org/download) (see note)
* [Node v0.10.0](http://nodejs.org/download)

Note: Pygments v1.6 is not compatible with Python 3. __You must have Python 2 installed__ until Pygments v2.0 is released.

---

## Getting Started

1. Verify __Ruby__, __Python__ and __Node__ are installed (see Prerequisites for supported versions)

        # each command returns a version number if it's installed
        ruby -v
        python --version
        node  --version

2. Clone from GitHub

        git clone -b gh-pages https://github.com/softlayer/softlayer-python.git

3. Go into the directory

        cd softlayer-python

4. Install Grunt and other dependencies

        npm install -g grunt-cli
        npm install
        grunt install

---

## Grunt

[Grunt](http://gruntjs.com) is a powerful tool for automating repetitive, ankle-biting tasks like:

* Concatenating and minifying LESS and CoffeeScript into CSS and JS, respectively
* Validating HTML markup
* Installing runtime dependencies for Ruby
* Previewing work locally before pushing to GitHub

To get started, check out the [Grunt Tasks](#grunt-tasks) section.


### Grunt Tasks

Run any of these commands to initiate a task (in alphabetical order).

* [grunt build](#grunt-build)
* [grunt install](#grunt-install)
* [grunt preview](#grunt-preview)
* [grunt serve](#grunt-serve)
* [grunt test](#grunt-test)


#### grunt build

Running `grunt build` performs the following:

1. Concats and minifies `*.js` files using [UglifyJS](http://lisperator.net/uglifyjs/)
2. Transforms, compiles, and compresses `*.less` to `*.css` using [RECESS](http://twitter.github.io/recess)


#### grunt install

Running `grunt install` performs the following:

1. Installs [Bundler](http://bundler.io)
2. Reads the Rubygem dependencies from [Gemfile](gemfile) in the root
3. Uses Bundler's CLI to installs all of the required gems


#### grunt preview

Running `grunt preview` performs the following:

1. Builds the website locally in the `_site` directory
2. Creates a local environment on [http://localhost:4000](http://localhost:4000)
3. Regenerates the site when files are modified

Preview mode lasts forever. It will not timeout after a period of non-usage. In order to kill it, press `CTRL+C`.


#### grunt serve

This tasks combines `grunt build` and `grunt preview`. Running `grunt serve` performs the following:

1. Concats and minifies `*.js` files using [UglifyJS](http://lisperator.net/uglifyjs/)
2. Transforms, compiles, and compresses `*.less` to `*.css` using [RECESS](http://twitter.github.io/recess)
3. Builds the website locally in the `_site` directory
4. Creates a local environment on [http://localhost:4000](http://localhost:4000)
5. Watches and regenerates a new `_site` directory when a file is modified (except CoffeeScript and LESS stylesheets)

Like with `grunt preview`, serve mode lasts forever. It will not timeout after a period of non-usage. In order to kill it, press `CTRL+C`.


#### grunt test

Running `grunt test` performs the following:

1. Builds the website locally in the `_site` directory
2. Tests all `*html` files against [W3's HTML validation service](http://validator.w3.org)
3. Spits out logs if it finds any issues


### Alias Tasks

The tasks listed above are referred to as "Alias" tasks. They're designed specifically for this boilerplate's framework and perform two or more of high-level functions:

* Reading in configuration data from package.json, config.yml, or OS environment variables
* Generating metadata dynamically
* Globbing multiple dependencies/plugins
* Creating files based on different options, sources, and destinations

#### Dependencies

This table shows which dependencies each Alias tasks uses.

| Task | Grunt Command | Dependencies |
| ---- | ------------- | ------------ |
| Build | `grunt build` | clean, coffee, concat, uglify, recess |
| Install | `grunt install` | shell |
| Preview | `grunt preview` | jekyll |
| Serve | `grunt serve` | clean, coffee, concat, uglify, recess, jekyll |
| Test | `grunt test` | jekyll, validation |


### Basic Tasks

Unlike Alias tasks, Basic tasks perform a much smaller set of instructions. Only a few are actually useful outside of the Alias task. Those tasks are as follows.

| Task   | Grunt Command | Description |
| ------ | ------------- | ----------- |
| Clean  | `grunt clean:after` | Deletes temp .cache directory used during `grunt build` and `grunt serve` |
| Jekyll | `grunt jekyll:preview` | Same as the alias task `grunt preview`|
| Recess | `grunt recess:unminify` | Compiles LESS files and drops a fresh CSS stylesheet in the `public/css/` directory |
| Recess | `grunt recess:minify` | Compiles and minifies LESS files and drops a fresh CSS stylesheet in the `public/css/` directory |
| Shell  | `grunt shell:bundler ` | Same as the alias task `grunt install` |

---

## Directory Structure

Below is the basic directory structure --- not including `node_modules`, `_site`, or any directories made specifically for one-off projects.

<pre>
├── _includes
│   ├── content
│   ├── featured
│   └── handlers
├── _layout
├── coffeescript
├── less
│   ├── components
│   ├── layout
│   ├── navigation
│   └── scaffolding
├── public
│   ├── css
│   ├── images
│   └── js

5 directories, 10 subdirectories
</pre>


### Directory

An overview of what each directory does/contains.

| Directory  | Overview  |
| ---------- | --------- |
| _includes | Contains “partials” (smaller, reusable chunks of content). Add semantic elements, like **header**, **footer**, and **nav**, and use them repeatedly. The `{% include file.ext %}` tag indicates a partial in your content. |
| _layouts | Canned, reusable templates. Design static layouts for specific needs, like **pages**, **news**, **articles**, and **blogs**. The `{{content}}` tag injects external content into your layouts. |
| coffeescript | The source for `*.coffee` scripts. Transpiled JavaScript files are stored in `public/javascript`. |
| less | The source for `*.less` stylesheets. Transpiled CSS files are stored in `public/css`. |
| public | Static and transpiled resources used exclusively by the website. This includes JavaScript, CSS, and images.|


### Subdirectory

An overview of each subdirectory.

| Directory | Subdirectory | Overview |
| --------- | ------------ | -------- |
| _includes | content ||
| _includes | featured ||
| _includes | handlers ||
| less | components | Style-basic HTML components, including `<table>`, `<code>`, `<img>`, and `<button>`. Most components in here have their own dedicated opening and closing tag. |
| less | layout ||
| less | navigation ||
| less | scaffolding ||
| public | css ||
| public | images ||
| public | js ||

---

## JavaScript CSS Attributes

Attributes are ordered alphabetically.

| Attribute ID         | Purpose                                                    |
| -------------------- | ---------------------------------------------------------- |
| ~~`date-milestone`~~     | ~~when the last milestone was closed~~                         |
| ~~`date-commit`~~        | ~~when the last `git push` or `git merge` was committed~~      |
| ~~`name-milestone`~~     | ~~name of the last milestone closed~~                          |
| `github-contributors`   | total number of contributors for a single repo      |
| ~~`num-members`~~        | ~~total number of active member in a single organization~~     |
| ~~`num-pulls`~~          | ~~total number of pull requests for a single repo~~            |
| `github-stargazers`     | total number of stargazers for a single repo               |
| `github-repos`          | total number of public repos for a single organization     |
| `github-version`        | version number for the last pegged released                |
| `github-watchers`       | total number of watchers/subscribers for a single repo     |

---

## Editor Settings

Use the settings below to help unify coding style for different editors.

* `indent_style = space`
* `end_of_line = lf`
* `charset = utf-8`
* `trim_trailing_whitespace = true`
* `insert_final_newline = false`
* `indent_size = 2`

Read the [Spacing](#spacing) section below for more information about indent size.


### Spacing

For consistency, use two spaces for the following file types:

* *.css (CSS)
* *.coffee (CoffeeScript)
* *.html (HTML)
* *.js (JavaScript)
* *.json (JSON)
* *.less (LESS)
* *.md (Markdown)
* *.yml (YAML)


### Sublime Text

Configure Sublime Text manually by opening `Preferences` > `Settings - User`, insert the lines below, and save your settings.

<pre>
{
  "translate_tabs_to_spaces": true,
  "tab_size": 2,
  "ensure_newline_at_eof_on_save": false,
  "default_encoding": "UTF-8",
  "default_line_ending": "lf",
  "trim_trailing_white_space_on_save": true
}
</pre>

---

## Sublime Text Packages

Sublime does not include every syntax highlight out-of-the-box. To get certain highlights, you have to install them by hand. The instructions below delve into the install processes for __CoffeeScript__, __Jekyll__, __LESS__, and __Liquid__.


### Built-in Tools

We recommend using [Package Control](http://sublime.wbond.net), Sublime's built-in tool for installing themes and syntaxes.

If you have Package Control, skip the rest of this and click any of the links below. If you don't, use this [install guide](http://sublime.wbond.net/installation) to walk you through all the install options. Once that's done, click any of these links:

* [CoffeeScript](#coffeescript)
* [Jekyll](#jekyll)
* [LESS](#less)
* [Liquid](#liquid)


#### CoffeeScript

1. Open Preferences > Package Control.
2. Type `Install Package` and hit return.
3. Type `Better CoffeeScript` and hit return.


#### Jekyll

1. Open Preferences > Package Control.
2. Type `Install Package` and hit return.
3. Type `Jekyll` and hit return.

> The Jekyll package includes syntaxes for HTML, JSON, Markdown, and Textile.


#### LESS

1. Open Preferences > Package Control.
2. Type `Install Package` and hit return.
3. Type `LESS` and hit return.


#### Liquid

1. Open Preferences > Package Control.
2. Type `Install Package` and hit return.
3. Type `Siteleaf Liquid Syntax` and hit return.

> The Liquid package includes syntax for HTML.

---

## Troubleshooting


#### Unable to parse "package.json" file

Remove any comments from package.json. Comment are not allowed in JSON files.


#### Errors while running `npm install`

Since the version in package.json is not used, it makes sense to either delete it or use a generic default such as "0" or "0.0.0". Modifying or removing the version, however, will cause errors during the `npm install` process. It is required by Node. We suggest leaving it as-is to avoid any issues.