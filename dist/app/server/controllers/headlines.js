(function() {
  var newsAggregator;

  newsAggregator = require('./../utils/NewsAggregator');

  exports.list = function(req, res, next) {
    res.set('Content-Type', 'application/json');
    return newsAggregator.list().then(function(news) {
      return res.render('api/headlines.json', {
        headlines: news
      });
    });
  };

}).call(this);
