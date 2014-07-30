module.exports = function(config) {
    config.set({
        basePath: '.',

        frameworks: ['jasmine', 'browserify'],

        files: [
            './bower_components/jquery/dist/jquery.js',
            './bower_components/angular/angular.js',
            './bower_components/angular-mocks/angular-mocks.js',
            './app/frontend/**/*.coffee',
            'app/frontend/tests/units/**/*.coffee'
        ],

        preprocessors: {
            'app/frontend/tests/units/**/*.coffee': ['browserify'],
            'app/frontend/**/*.coffee': ['browserify']
        },

        plugins: [
            'karma-*',
            require('./node_modules/karma-phantomjs-launcher')
        ],

        autoWatch: true,
        singleRun: false,

        browsers: ['PhantomJS'],

        browserify: {
            extensions: ['.coffee'],
            transform: ['coffeeify', 'browserify-data', 'browserify-shim'],
            debug: true
        }
    });
};
