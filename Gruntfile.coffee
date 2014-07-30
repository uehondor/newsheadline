module.exports = (grunt) ->

  @initConfig
    pkg: grunt.file.readJSON 'package.json'
    clean:
      dist: 'dist'
    copy:
      views:
        expand: true
        src: ['**/*.html', '**/*.json']
        dest: 'dist/app/server/views/'
        cwd: 'app/server/views'
    coffee:
      compileCoffee:
        expand: true
        src: 'app/**/*.coffee'
        dest: 'dist/'
        ext: '.js'
    less:
      build:
        options:
          path: ['less']
        files:
          'dist/app/frontend/assets/css/styles.css': 'app/frontend/assets/less/styles.less'
    browserify:
      dev:
        files:
          'dist/app/frontend/assets/js/app.js': 'app/frontend/app.coffee'
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
          script: 'bin/server.js'
    karma:
      unit:
        configFile: 'karma.conf.js'

  @loadNpmTasks 'grunt-contrib-coffee'
  @loadNpmTasks 'grunt-express-server'
  @loadNpmTasks 'grunt-contrib-clean'
  @loadNpmTasks 'grunt-contrib-copy'
  @loadNpmTasks 'grunt-contrib-less'
  @loadNpmTasks 'grunt-browserify'
  @loadNpmTasks 'grunt-karma'

  # Default task(s).
  @registerTask 'default', ['build', 'serve']
  @registerTask 'tests', ['karma:unit']
  @registerTask 'serve', ['express:dev']
  @registerTask 'build', ['clean', 'coffee', 'less', 'browserify:dev', 'copy:views']
