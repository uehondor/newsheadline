(function() {
  var newsHeadlineModule;

  require('angular');

  newsHeadlineModule = angular.module('headlines', []);

  require('./controllers/headlines-controller')(newsHeadlineModule);

  module.exports = newsHeadlineModule;

}).call(this);
