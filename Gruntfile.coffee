module.exports = (grunt) ->

  @initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compileCoffee:
        files:
          '.app/app.js': 'app/app.coffee'
          '.app/models/BBCNewsFeed.js': 'app/models/BBCNewsFeed.coffee'
          '.app/models/SkyNewsFeed.js': 'app/models/SkyNewsFeed.coffee'
          '.app/models/NewsFeed.js': 'app/models/NewsFeed.coffee'
          '.app/utils/NewsAggregator.js': 'app/utils/NewsAggregator.coffee'
          '.app/controllers/headlines.js': 'app/controllers/headlines.coffee'
          '.app/controllers/index.js': 'app/controllers/index.coffee'
          '.app/controllers/errors.js': 'app/controllers/errors.coffee'
    less:
      build:
        options:
          path: ['less']
        files:
          'public/css/styles.css': 'frontend/less/styles.less'
    browserify:
      dev:
        files:
          'public/js/app.js': 'frontend/app/app.coffee'
        options:
          browserifyOptions:
            extensions: ['.coffee', '.js']
          bundleOptions:
            debug: true
          transform: ['coffeeify', [ 'deamdify', { global: true } ]]
    express:
      options:
        port: 3000
      dev:
        options:
          script: 'server.js'

  @loadNpmTasks 'grunt-contrib-coffee'
  @loadNpmTasks 'grunt-express-server'
  @loadNpmTasks 'grunt-contrib-less'
  @loadNpmTasks 'grunt-browserify'

  # Default task(s).
  @registerTask 'default', ['build', 'express:dev']
  @registerTask 'build', ['coffee', 'less', 'browserify:dev']
