(function() {
  var HeadlinesController;

  HeadlinesController = (function() {
    HeadlinesController.$inject = ['$scope', '$http'];

    function HeadlinesController(scope, http) {
      this.scope = scope;
      this.http = http;
      this.scope.headlines = [];
      this.scope.load = (function(_this) {
        return function() {
          return _this.http.get('/headlines').success(function(data) {
            return _this.scope.headlines = data._embedded.headlines;
          });
        };
      })(this);
      this.scope.load();
    }

    return HeadlinesController;

  })();

  module.exports = function(newsHeadlineModule) {
    return newsHeadlineModule.controller('HeadlinesController', HeadlinesController);
  };

}).call(this);
