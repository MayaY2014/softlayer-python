#
# * Gruntfile
# * Provides configuration for tasks and Grunt plugins
# *
# * Copyright (c) 2014 SoftLayer, an IBM Company
# * Released under the MIT license
#

module.exports = (grunt) ->

  grunt.initConfig {
    pkg: grunt.file.readJSON("package.json")
    site: grunt.file.readYAML("_config.yml")
    banner: "/*!\n" +
            " * \n" +
            " * <%= site.project.name %>\n" +
            " * Boilerplate version <%= site.project.version %>, Built on <%= grunt.template.today(\"mm-dd-yyyy\") %>\n" +
            " * Copyright (c) <%= grunt.template.today(\"yyyy\") %> <%= site.owner.name %>. All rights reserved.\n" +
            " * Code and documentation licensed under <%= site.license.type %>.\n" +
            " * \n" +
            " */\n\n"

    # Makes Bundler install the local Gemfile
    shell:
      bundler:
        command: [
          "gem update --system"
          "gem install bundler"
          "bundle install"
        ].join("&&")
        options:
          stdout: true

    clean:
      # Does some light cleaning before the party begins
      before: [
        "public/css/main*"
        "public/js/main*"
        "validation-*.json"
        "*.lock"
      ]
      # And cleans up once the party is over
      after: [
        "coffeescript/.stash"
      ]

    # Cooks CoffeeScript into JavaScript and drops the new files into a temp directory
    coffee:
      cache:
        expand: true
        cwd: "coffeescript/"
        src: ["*.coffee"]
        dest: "coffeescript/.stash/"
        ext: ".js"

    # Pounds on Javascript until it becomes one file
    concat:
      main:
        options:
          banner: "<%= banner %>"
        src: [
          "<%= coffee.cache.dest %>octokit.js"
          "<%= coffee.cache.dest %>unclassy.js"
          "<%= coffee.cache.dest %>lateral.js"
          "<%= coffee.cache.dest %>tocify.js"
          "<%= coffee.cache.dest %>metrics.js"
          "<%= coffee.cache.dest %>folio.js"
        ]
        dest: "public/js/main.js"

    # Now we're flattening Javascript
    uglify:
      main:
        options:
          banner: "<%= banner %>"
          report: "min"
        src: "<%= concat.main.dest %>"
        dest: "public/js/main.js"

    # Rounds up all the Less morsels to make one big CSS cookie
    recess:
      unminify:
        options:
          compile: true
          compress: false
          banner: "<%= banner %>"
        src: ["less/main.less"]
        dest: "public/css/main.css"

      # And we're flattening CSS, as well
      minify:
        options:
          compile: true
          compress: true
          banner: "<%= banner %>"
        src: ["less/main.less"]
        dest: "public/css/main.css"

    # Makes starting Jekyll simpler
    jekyll:
      test: {}
      preview:
        options:
          watch: true
          serve: true
          baseurl: ["\"\""]

    # Determines whether HTML DOM and elements complies with W3C standards
    validation:
      options:
        charset: "UTF-8"
        doctype: "HTML5"
        failHard: true
        reset: true
        relaxerror: [
          "Bad value text/html for attribute content on element meta"
          "Element img is missing required attribute src."
          "No p element in scope but a p end tag seen."
          "The align attribute on the th element is obsolete."
          "The align attribute on the td element is obsolete."
        ]

      files:
        src: [
          "_site/*.html"
          "_site/**/*.html"
        ]
  }

  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-html-validation"
  grunt.loadNpmTasks "grunt-jekyll"
  grunt.loadNpmTasks "grunt-recess"
  grunt.loadNpmTasks "grunt-shell"

  grunt.registerTask "build", [
    "clean:before"
    "coffee"
    "concat"
    "uglify"
    "recess:minify"
    "clean:after"
  ]

  grunt.registerTask "build:pretty", [
    "clean:before"
    "coffee"
    "concat"
    "recess:unminify"
    "clean:after"
  ]

  grunt.registerTask "install", [
    "shell:bundler"
  ]

  grunt.registerTask "preview", [
    "jekyll:preview"
  ]

  grunt.registerTask "serve", [
    "build"
    "jekyll:preview"
  ]

  grunt.registerTask "serve:pretty", [
    "build:pretty"
    "jekyll:preview"
  ]

  grunt.registerTask "test", [
    "jekyll:test"
    "validation"
  ]