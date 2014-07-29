(function() {
  var bbcNewsFeed, q, skyNewsFeed, updateItemWithFeedInfo;

  q = require('q');

  bbcNewsFeed = require('./../models/BBCNewsFeed');

  skyNewsFeed = require('./../models/SkyNewsFeed');

  exports.list = function(maxPerFeed) {
    var deferred, news;
    if (maxPerFeed == null) {
      maxPerFeed = 10;
    }
    deferred = q.defer();
    news = [];
    q.all([bbcNewsFeed.list(maxPerFeed), skyNewsFeed.list(maxPerFeed)]).then(function(feeds) {
      var feed, item, _i, _j, _len, _len1, _ref;
      for (_i = 0, _len = feeds.length; _i < _len; _i++) {
        feed = feeds[_i];
        _ref = feed.items;
        for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
          item = _ref[_j];
          news.push(updateItemWithFeedInfo(feed, item));
        }
      }
      return deferred.resolve(news);
    });
    return deferred.promise;
  };

  updateItemWithFeedInfo = function(feed, item) {
    item.source = feed.name;
    item.website = feed.website;
    return item;
  };

}).call(this);
